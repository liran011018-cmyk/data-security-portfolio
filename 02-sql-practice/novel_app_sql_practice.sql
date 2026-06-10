-- =========================================
-- 项目名称：小说阅读 App 用户行为分析 SQL 练习
-- 项目说明：通过用户表、小说表、阅读记录表和付费记录表，练习 SQL 建表、插入数据和基础查询。
-- =========================================
-- 一、选择数据库
USE sql_practice;

-- 二、删除旧表
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS reading_logs;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS users;

-- 三、创建用户表
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50),
    age INT,
    register_date DATE
);

-- 四、创建小说表
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(100),
    category VARCHAR(50),
    author VARCHAR(50),
    publish_date DATE
);

-- 五、创建阅读记录表
CREATE TABLE reading_logs (
    log_id INT PRIMARY KEY,
    user_id INT,
    book_id INT,
    read_date DATE,
    read_minutes INT
);

-- 六、创建付费记录表
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    user_id INT,
    pay_date DATE,
    amount DECIMAL(10,2),
    pay_type VARCHAR(20)
);

-- 七、插入模拟数据
INSERT INTO users (user_id, username, city, age, register_date) VALUES
(1, '张三', '北京', 22, '2026-01-01'),
(2, '李四', '上海', 25, '2026-01-02'),
(3, '王五', '深圳', 19, '2026-01-03'),
(4, '赵六', '北京', 30, '2026-01-04'),
(5, '孙七', '杭州', 27, '2026-01-05'),
(6, '周八', '广州', 21, '2026-01-06');

INSERT INTO books (book_id, book_name, category, author, publish_date) VALUES
(101, '长夜余火', '科幻', '作者A', '2025-12-01'),
(102, '山海旧梦', '玄幻', '作者B', '2025-12-05'),
(103, '城市边缘人', '都市', '作者C', '2025-12-10'),
(104, '迷雾档案', '悬疑', '作者D', '2025-12-15');

INSERT INTO reading_logs (log_id, user_id, book_id, read_date, read_minutes) VALUES
(1, 1, 101, '2026-01-10', 35),
(2, 1, 102, '2026-01-10', 20),
(3, 2, 101, '2026-01-10', 45),
(4, 2, 103, '2026-01-11', 30),
(5, 3, 102, '2026-01-11', 15),
(6, 4, 104, '2026-01-11', 60),
(7, 4, 101, '2026-01-12', 25),
(8, 5, 103, '2026-01-12', 50),
(9, 6, 104, '2026-01-12', 10),
(10, 6, 102, '2026-01-13', 40);

INSERT INTO payments (payment_id, user_id, pay_date, amount, pay_type) VALUES
(1, 1, '2026-01-10', 29.90, '充值'),
(2, 2, '2026-01-10', 9.90, '章节购买'),
(3, 4, '2026-01-11', 49.90, '会员'),
(4, 5, '2026-01-12', 19.90, '充值');

-- 八、基础查询练习
SELECT * FROM books;
SELECT * FROM users;
SELECT * FROM reading_logs;
SELECT * FROM payments;

SELECT * FROM users
WHERE city = '北京';

SELECT * FROM users
WHERE age>23;

SELECT * FROM books
ORDER BY publish_date ASC;

SELECT * FROM reading_logs
WHERE read_minutes>30;
