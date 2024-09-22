-- prefix index 설정
Alter table <테이블명> add key (index_prefix_test(2));

-- 적절한 prefix index 크기 찾기
-- test라는 컬럼의 고유성을 조사
-- e.g. user_datadp 5만개의 로우가 존재, 고유한 이름이 300개라면 uniqu = 0.006
SELECT COUNT(DISTINCT test) / COUNT(*) as uniqu FROM user_data;

-- n값을 1씩 늘리면서 적절한 prefix Index 크기를 찾는다.
-- 1과 가장 가까울수록 고르게 분포되어 있다,
SELECT COUNT(DISTINCT LEFT(test, n)) / COUNT(*) as uniqu FROM user_data;