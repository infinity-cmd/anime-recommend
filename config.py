import os

BASE_DIR = os.path.abspath(os.path.dirname(__file__))


class Config:
    DB_FOLDER = os.path.join(BASE_DIR, 'data')
    DB_PATH = os.path.join(DB_FOLDER, 'anime_db.sqlite')
    SQL_FOLDER = os.path.join(BASE_DIR, 'sql')

    # 确保目录存在
    os.makedirs(DB_FOLDER, exist_ok=True)