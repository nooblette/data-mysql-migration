CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    a VARCHAR(255),
    b VARCHAR(255),
    c VARCHAR(255),
    INDEX a_b(a, b)
);
-- Index를 사용한 Order By
EXPLAIN SELECT a, b FROM users ORDER BY a, b;

-- File Sort
EXPLAIN SELECT * FROM users ORDER BY c, a;

-- a라는 필드에 대해서 내림차순 정렬을 할건데, "1", "20"으로 적재되어 있는 경우
-- 의도와 달리 "1", "20" 순서로 출력
SELECT * FROM users ORDER BY a ASC;

-- a 컬럼을 정수로 인식하여 "20", "1" 순서로 내림차순 정렬된다.
SELECT * FROM users ORDER BY a*1 ASC;