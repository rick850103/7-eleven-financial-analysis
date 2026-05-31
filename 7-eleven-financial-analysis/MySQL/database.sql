CREATE DATABASE financial_analysis;
USE financial_analysis;

CREATE TABLE income_statement (
    id INT AUTO_INCREMENT PRIMARY KEY,
    科目名稱 VARCHAR(100),
    年度 YEAR,
    金額 BIGINT
);

CREATE TABLE balance_sheet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    科目名稱 VARCHAR(100),
    年度 YEAR,
    金額 BIGINT
);

CREATE TABLE cash_flow (
    id INT AUTO_INCREMENT PRIMARY KEY,
    科目名稱 VARCHAR(100),
    年度 YEAR,
    金額 BIGINT
);

CREATE TABLE financial_ratios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    比率名稱 VARCHAR(50),
    年度 YEAR,
    數值 DECIMAL(10,4)
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/rick8/Desktop/FIN/income_statement.csv'
INTO TABLE income_statement
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(科目名稱, 年度, 金額);

USE financial_analysis;

LOAD DATA LOCAL INFILE 'C:/Users/rick8/Desktop/FIN/balance_sheet.csv'
INTO TABLE balance_sheet
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(科目名稱, 年度, 金額);

LOAD DATA LOCAL INFILE 'C:/Users/rick8/Desktop/FIN/cash_flow.csv'
INTO TABLE cash_flow
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(科目名稱, 年度, 金額);

LOAD DATA LOCAL INFILE 'C:/Users/rick8/Desktop/FIN/financial_ratios.csv'
INTO TABLE financial_ratios
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(比率名稱, 年度, 數值);

SELECT * FROM financial_ratios;

-- 找出三年內獲利能力最差的年度
SELECT 年度, 數值
FROM financial_ratios
WHERE 比率名稱 = '營業利益率'
ORDER BY 數值 ASC;

-- 列出2025年所有比率，由高到低排序
SELECT 比率名稱, 數值
FROM financial_ratios
WHERE 年度 = 2025
ORDER BY 數值 DESC;

-- 計算每個比率三年平均
SELECT 比率名稱, ROUND(AVG(數值), 4) AS 三年平均
FROM financial_ratios
GROUP BY 比率名稱
ORDER BY 三年平均 DESC;
