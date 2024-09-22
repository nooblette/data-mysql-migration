CREATE TABLE test1(
	seq INT PRIMARY KEY AUTO_INCREMENT,
    one_field BIGINT,
    two_field BIGINT,
    hash_email VARCHAR(500),
    INDEX idx_hash_email (hash_email), 			-- 해시 인덱스
    INDEX idx_col1_col2 (one_field, two_field) 	-- 복합 인덱스
);

-- 재귀 호출하며 test1 테이블에 insert
INSERT INTO test1(one_field, two_field)
-- WITH RECURSIVE () : 재귀를 돌면서 () 내에 있는 SELECT 쿼리를 실행한다.
WITH RECURSIVE my_cte AS (
    SELECT 1 AS n, CAST(1 AS DOUBLE) AS abc, CAST(2 AS DOUBLE) AS se
    UNION ALL
    SELECT 1 + n, CAST(1 + n AS DOUBLE), CAST(2 + n AS DOUBLE) FROM my_cte WHERE n < 10000 -- 10000번 재귀 호출
)
SELECT abc, se FROM my_cte;

-- mysql의 재귀 호출 최대값을 15000으로 설정(기본 값은 1000)
SET @@cte_max_recursion_depth = 15000;

-- 결과 확인
SELECT count(1) FROM test1;

-- 실행 계획 확인
-- full scan을 타는 경우
EXPLAIN SELECT hash_email, one_field, two_field FROM test1 WHERE two_field = 3;

-- idx_col1_col2를 타는 경우
EXPLAIN SELECT one_field, two_field FROM test1 WHERE two_field = 3;

-- PK index를 타는 경우
EXPLAIN SELECT seq, one_field, two_field  FROM test1;
