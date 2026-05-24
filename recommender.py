# 文件名: recommender.py
import random
from collections import Counter
from db_manager import get_db_connection


def recommend_for_user(user_id):
    #核心推荐逻辑：基于标签匹配推荐未看过的动漫
    conn = get_db_connection()
    cur = conn.cursor()
    # 1. 获取用户信息
    cur.execute('SELECT name FROM user WHERE id = ?', (user_id,))
    user_row = cur.fetchone()
    if not user_row:
        return {'success': False, 'error': '用户不存在'}
    user_name = user_row['name']

    # 2. 获取观看历史 ID
    cur.execute('SELECT anime_id FROM user_anime WHERE user_id = ?', (user_id,))
    watched_ids = [row['anime_id'] for row in cur.fetchall()]

    # 冷启动处理：如果没有观看记录，随机推荐
    if not watched_ids:
        cur.execute('SELECT id, title, description, cover_url FROM anime ORDER BY RANDOM() LIMIT 1')
        row = cur.fetchone()
        conn.close()
        return {
            'success': True,
            'user_name': user_name,
            'anime': {'title': row['title'], 'desc': row['description'], 'cover': row['cover_url']},
            'reason': "👋 欢迎新朋友！随机为你推荐一部佳作。",
            'watched_list': []
        }

    # 3. 分析标签 (统计用户看过动漫中出现频率最高的标签)
    placeholders = ','.join('?' * len(watched_ids))
    cur.execute(f'''
        SELECT s.name, COUNT(*) as cnt 
        FROM anime_style a_s
        JOIN style s ON a_s.style_id = s.id
        WHERE a_s.anime_id IN ({placeholders})
        GROUP BY s.id ORDER BY cnt DESC LIMIT 3
    ''', watched_ids)

    top_styles = [row['name'] for row in cur.fetchall()]

    if not top_styles:
        conn.close()
        return {'success': False, 'error': '数据不足，无法分析喜好'}

    # 4. 寻找候选作品 (具有相同标签且用户未看过)
    style_placeholders = ','.join('?' * len(top_styles))
    cur.execute(f'''
        SELECT DISTINCT a_s.anime_id 
        FROM anime_style a_s
        JOIN style s ON a_s.style_id = s.id
        WHERE s.name IN ({style_placeholders})
    ''', top_styles)

    candidate_ids = [row['anime_id'] for row in cur.fetchall()]
    # 过滤掉已经看过的
    unwatched_ids = [aid for aid in candidate_ids if aid not in watched_ids]

    if not unwatched_ids:
        conn.close()
        return {'success': False, 'error': '库中相关作品都已看完啦！'}

    # 5. 随机选择一个推荐
    picked_id = random.choice(unwatched_ids)
    cur.execute('SELECT title, description, cover_url FROM anime WHERE id = ?', (picked_id,))
    row = cur.fetchone()

    # 获取用户的观看列表用于展示
    cur.execute(f'''
        SELECT a.title FROM anime a
        JOIN user_anime ua ON a.id = ua.anime_id
        WHERE ua.user_id = ?
    ''', (user_id,))
    watched_titles = [r['title'] for r in cur.fetchall()]

    conn.close()

    return {
        'success': True,
        'user_name': user_name,
        'anime': {'title': row['title'], 'desc': row['description'], 'cover': row['cover_url']},
        'reason': f"🎯 基于您喜爱的标签 [{', '.join(top_styles)}] 为您推荐",
        'watched_list': watched_titles
    }


def get_all_users():
    """获取所有用户列表"""
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT id, name FROM user')
    users = cur.fetchall()
    conn.close()
    return users


# 本地测试用
if __name__ == '__main__':
    print(recommend_for_user(1))