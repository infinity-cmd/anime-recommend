-- 清理旧表（如果存在）
DROP TABLE IF EXISTS user_anime;
DROP TABLE IF EXISTS anime_style;
DROP TABLE IF EXISTS anime;
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS style;

-- 1. 用户表
CREATE TABLE user (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. 风格标签表
CREATE TABLE style (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

-- 3. 动漫表 (增加 cover_url 字段)
CREATE TABLE anime (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT,
    cover_url TEXT,
    region TEXT DEFAULT 'Unknown' -- 区分国漫/日漫
);

-- 4. 用户观看历史
CREATE TABLE user_anime (
    user_id INTEGER,
    anime_id INTEGER,
    watched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(anime_id) REFERENCES anime(id),
    PRIMARY KEY (user_id, anime_id)
);

-- 5. 动漫 - 风格关联表
CREATE TABLE anime_style (
    anime_id INTEGER,
    style_id INTEGER,
    FOREIGN KEY(anime_id) REFERENCES anime(id),
    FOREIGN KEY(style_id) REFERENCES style(id),
    PRIMARY KEY (anime_id, style_id)
);