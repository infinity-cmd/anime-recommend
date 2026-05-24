-- 插入风格标签
INSERT INTO style (name) VALUES
('热血'), ('冒险'), ('搞笑'), ('治愈'), ('科幻'), ('悬疑'),
('武侠'), ('玄幻'), ('日常'), ('战斗'), ('国漫'), ('日漫'), ('童年回忆');

-- 插入动漫数据 (涵盖你提到的所有作品 + 补充)
-- 格式：title, description, cover_url (使用占位图服务带文字，方便演示), region
INSERT INTO anime (title, description, cover_url, region) VALUES
('火影忍者', '鸣人努力成为火影的热血故事。', 'https://placehold.co/400x600/orange/white?text=Naruto', '日漫'),
('海贼王', '路飞寻找 ONE PIECE 的大冒险。', 'https://placehold.co/400x600/red/white?text=OnePiece', '日漫'),
('弹珠传说', '传说中的弹珠游戏对决。', 'https://placehold.co/400x600/blue/white?text=Marble', '国漫'),
('喜羊羊与灰太狼', '羊村与灰太狼的斗智斗勇。', 'https://placehold.co/400x600/green/white?text=PleasantGoat', '国漫'),
('熊出没', '光头强与熊大熊二的森林故事。', 'https://placehold.co/400x600/brown/white?text=BoonieBears', '国漫'),
('猪猪侠', '猪猪侠的童话世界冒险。', 'https://placehold.co/400x600/pink/white?text=GGBond', '国漫'),
('秦时明月', '荆轲之子天明在秦朝的武侠传奇。', 'https://aisearch.cdn.bcebos.com/pic_create/2026-04-02/10/54de0d3db255ba3b.jpg?x-bce-process=image/watermark,image_cGljX2NyZWF0ZS93YXRlcm1hcmsvaW1hZ2VfZWRpdF9haV9jcmVhdGVfd2F0ZXJtYXJrLnBuZw==,P_10', '国漫'),
--'https://placehold.co/400x600/black/gold?text=QinMoon'
('侠岚', '拥有元气的侠岚对抗穹奇。', 'https://placehold.co/400x600/purple/white?text=XiaLan', '国漫'),
('画江湖之不良人', '唐朝末年，不良人的江湖纷争。', 'https://placehold.co/400x600/darkred/white?text=BadMen', '国漫'),
('宇宙星神', '星际间的机器人大战。', 'https://placehold.co/400x600/navy/white?text=SpaceGods', '国漫'),
('精灵宝可梦', '小智与皮卡丘的旅程。', 'https://placehold.co/400x600/yellow/black?text=Pokemon', '日漫'),
('名侦探柯南', '真相只有一个！', 'https://placehold.co/400x600/blue/white?text=Conan', '日漫'),
('甜心格格', '古代宫廷的搞笑日常。', 'https://placehold.co/400x600/pink/purple?text=SweetPrincess', '国漫'),
('斗罗大陆', '唐三在斗罗世界的成神之路。','https://aisearch.cdn.bcebos.com/pic_create/2026-04-02/10/92118fd46aa478b5.jpg', '国漫'),

 --'https://placehold.co/400x600/silver/black?text=SoulLand'
('吞噬星空', '罗峰在末世废土进化变强。', 'https://placehold.co/400x600/darkgreen/white?text=SwallowedStar', '国漫'),
('斗破苍穹', '莫欺少年穷，萧炎的逆袭。', 'https://placehold.co/400x600/firebrick/white?text=BattleThrough', '国漫'),

('鬼灭之刃', '炭治郎为救妹妹斩鬼。', 'https://placehold.co/400x600/green/black?text=DemonSlayer', '日漫'),
('进击的巨人', '人类与巨人的生存之战。', 'https://placehold.co/400x600/brown/white?text=AttackTitan', '日漫'),
('罗小黑战记', '猫妖罗小黑的流浪之旅。', 'https://placehold.co/400x600/black/white?text=LuoXiaoHei', '国漫'),
('伍六七', '失忆刺客的搞笑日常。', 'https://placehold.co/400x600/white/black?text=ScissorSeven', '国漫');

-- 建立动漫与风格的关联 (简化版，实际可更复杂)
-- 假设 ID 对应关系：1热血, 2冒险, 3搞笑, 4治愈, 5科幻, 6悬疑, 7武侠, 8玄幻, 9日常, 10战斗, 11国漫, 12日漫, 13童年
-- 火影 (1): 热血, 冒险, 战斗, 日漫
INSERT INTO anime_style VALUES (1, 1), (1, 2), (1, 10), (1, 12);
-- 海贼 (2): 热血, 冒险, 搞笑, 日漫
INSERT INTO anime_style VALUES (2, 1), (2, 2), (2, 3), (2, 12);
-- 弹珠 (3): 冒险, 战斗, 国漫, 童年
INSERT INTO anime_style VALUES (3, 2), (3, 10), (3, 11), (3, 13);
-- 喜羊羊 (4): 搞笑, 日常, 国漫, 童年
INSERT INTO anime_style VALUES (4, 3), (4, 9), (4, 11), (4, 13);
-- 熊出没 (5): 搞笑, 日常, 国漫, 童年
INSERT INTO anime_style VALUES (5, 3), (5, 9), (5, 11), (5, 13);
-- 猪猪侠 (6): 冒险, 搞笑, 国漫, 童年
INSERT INTO anime_style VALUES (6, 2), (6, 3), (6, 11), (6, 13);
-- 秦时 (7): 武侠, 玄幻, 国漫, 战斗
INSERT INTO anime_style VALUES (7, 7), (7, 8), (7, 11), (7, 10);
-- 侠岚 (8): 武侠, 玄幻, 国漫, 战斗
INSERT INTO anime_style VALUES (8, 7), (8, 8), (8, 11), (8, 10);
-- 不良人 (9): 武侠, 悬疑, 国漫, 战斗
INSERT INTO anime_style VALUES (9, 7), (9, 6), (9, 11), (9, 10);
-- 宇宙星神 (10): 科幻, 战斗, 国漫, 童年
INSERT INTO anime_style VALUES (10, 5), (10, 10), (10, 11), (10, 13);
-- 宝可梦 (11): 冒险, 治愈, 日漫, 童年
INSERT INTO anime_style VALUES (11, 2), (11, 4), (11, 12), (11, 13);
-- 柯南 (12): 悬疑, 日常, 日漫
INSERT INTO anime_style VALUES (12, 6), (12, 9), (12, 12);
-- 甜心格格 (13): 搞笑, 日常, 国漫, 童年
INSERT INTO anime_style VALUES (13, 3), (13, 9), (13, 11), (13, 13);
-- 斗罗 (14): 玄幻, 战斗, 国漫, 热血
INSERT INTO anime_style VALUES (14, 8), (14, 10), (14, 11), (14, 1);
-- 吞噬 (15): 科幻, 玄幻, 国漫, 战斗
INSERT INTO anime_style VALUES (15, 5), (15, 8), (15, 11), (15, 10);
-- 斗破 (16): 玄幻, 热血, 国漫, 战斗
INSERT INTO anime_style VALUES (16, 8), (16, 1), (16, 11), (16, 10);
-- 鬼灭 (17): 热血, 战斗, 日漫, 治愈
INSERT INTO anime_style VALUES (17, 1), (17, 10), (17, 12), (17, 4);
-- 巨人 (18): 热血, 悬疑, 日漫, 战斗
INSERT INTO anime_style VALUES (18, 1), (18, 6), (18, 12), (18, 10);
-- 罗小黑 (19): 治愈, 搞笑, 国漫, 战斗
INSERT INTO anime_style VALUES (19, 4), (19, 3), (19, 11), (19, 10);
-- 伍六七 (20): 搞笑, 战斗, 国漫, 治愈
INSERT INTO anime_style VALUES (20, 3), (20, 10), (20, 11), (20, 4);

-- 插入测试用户
INSERT INTO user (name) VALUES ('热血少年·小明'), ('国漫爱好者·小红'), ('悬疑迷·小刚'), ('萌新·路人');

-- 插入用户观看历史
-- 小明 (ID 1): 看过 火影, 海贼, 斗罗 -> 推荐 热血/冒险类 (如 巨人, 斗破)
INSERT INTO user_anime (user_id, anime_id) VALUES (1, 1), (1, 2), (1, 14);
-- 小红 (ID 2): 看过 秦时, 不良人, 罗小黑 -> 推荐 国漫/武侠类 (如 侠岚, 伍六七)
INSERT INTO user_anime (user_id, anime_id) VALUES (2, 7), (2, 9), (2, 19);
-- 小刚 (ID 3): 看过 柯南, 鬼灭 -> 推荐 悬疑/战斗类
INSERT INTO user_anime (user_id, anime_id) VALUES (3, 12), (3, 17);