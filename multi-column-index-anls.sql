-- 로우 조회
select * from test1 WHERE two_field = 3;

-- type : index
EXPLAIN SELECT seq, one_field, two_field FROM test1 WHERE two_field = 3;

-- type : ref
EXPLAIN SELECT one_field, two_field FROM test1 WHERE one_field = 2 AND two_field = 3;

-- type : range
EXPLAIN SELECT one_field, two_field FROM test1 WHERE one_field = 2 AND two_field >= 3;

-- 인덱스 목록 조회
SHOW INDEX FROM test1;