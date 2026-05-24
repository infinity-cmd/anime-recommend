import sqlite3
import os
from config import Config


def init_database():
    """
    读取 sql/ 目录下的脚本并初始化数据库
    """
    if os.path.exists(Config.DB_PATH):
        print(f"ℹ️  数据库已存在: {Config.DB_PATH}")
        return

    conn = sqlite3.connect(Config.DB_PATH)
    cursor = conn.cursor()

    sql_files = ['schema.sql', 'seed_data.sql']

    for filename in sql_files:
        filepath = os.path.join(Config.SQL_FOLDER, filename)
        if not os.path.exists(filepath):
            raise FileNotFoundError(f"SQL 文件未找到: {filepath}")

        with open(filepath, 'r', encoding='utf-8') as f:
            sql_script = f.read()

        print(f"🚀 正在执行 {filename} ...")
        try:
            # executescript 可以执行包含多条语句的脚本
            cursor.executescript(sql_script)
            print(f"✅ {filename} 执行成功")
        except Exception as e:
            print(f"❌ 执行 {filename} 失败: {e}")
            raise e

    conn.commit()
    conn.close()
    print("🎉 数据库初始化完成！")


def get_db_connection():
    """获取数据库连接"""
    if not os.path.exists(Config.DB_PATH):
        init_database()
    conn = sqlite3.connect(Config.DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn