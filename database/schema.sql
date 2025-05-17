-- JENS游戏合集数据库结构

-- 创建数据库
CREATE DATABASE IF NOT EXISTS jens_sgame CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 使用数据库
USE jens_sgame;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    avatar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

-- 创建游戏记录表
CREATE TABLE IF NOT EXISTS game_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_type ENUM('sokoban', 'tetris', 'tank', 'snake') NOT NULL,
    score INT NOT NULL,
    level INT,
    duration INT,  -- 游戏时长(秒)
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- 创建游戏设置表
CREATE TABLE IF NOT EXISTS game_settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_type ENUM('sokoban', 'tetris', 'tank', 'snake') NOT NULL,
    settings JSON NOT NULL,  -- 存储游戏个性化设置
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY (user_id, game_type)
);

-- 创建游戏进度表 (用于保存游戏进度)
CREATE TABLE IF NOT EXISTS game_progress (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    game_type ENUM('sokoban', 'tetris', 'tank', 'snake') NOT NULL,
    level INT NOT NULL DEFAULT 1,
    game_state JSON,  -- 存储游戏状态
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY (user_id, game_type)
);

-- 添加索引提升查询效率
CREATE INDEX idx_game_records_user_game ON game_records(user_id, game_type);
CREATE INDEX idx_game_records_score ON game_records(score);
CREATE INDEX idx_game_progress_user_game ON game_progress(user_id, game_type); 