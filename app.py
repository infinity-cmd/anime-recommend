from flask import Flask, render_template, request
from recommender import recommend_for_user, get_all_users
from db_manager import init_database
from config import Config
import os

app = Flask(__name__)

# 启动前检查数据库
if not os.path.exists(Config.DB_PATH):
    print("⚠️  数据库未检测到，正在自动初始化...")
    init_database()


@app.route('/')
def index():
    users = get_all_users()
    return render_template('index.html', users=users)


@app.route('/recommend')
def recommend():
    uid = request.args.get('user_id')
    if not uid:
        return "请选择用户", 400

    result = recommend_for_user(int(uid))
    users = get_all_users()

    return render_template('result.html', result=result, users=users, current_uid=uid)


if __name__ == '__main__':
    app.run(debug=True, port=5000)