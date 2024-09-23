CREATE TABLE test2 (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- 300개의 데이터 적재
SET @i = 0;
INSERT INTO test2 (id, name)
SELECT (@i := @i + 1) AS id, CONCAT('Name', @i)
FROM information_schema.tables
LIMIT 300;

SELECT * FROM test2 ORDER BY id DESC LIMIT 100 OFFSET 50;
SELECT * FROM test2 WHERE id < 300 - 50 ORDER BY id DESC LIMIT 100;