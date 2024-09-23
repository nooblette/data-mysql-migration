CREATE TABLE test1(
		pk INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(500)
);

-- 쿼리 1
INSERT INTO test1 (pk, name) 
VALUES(1, '1'), (2, 'b') 
ON DUPLICATE KEY UPDATE name=VALUES(name))

-- 쿼리 2
INSERT INTO test1 (pk, name) 
VALUES(2, 'b'), (1, '1')
ON DUPLICATE KEY UPDATE name=VALUES(name))