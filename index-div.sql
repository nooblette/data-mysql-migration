CREATE TABLE test (
	name VARCHAR(255),
	second_name VARCHAR(255),
	one INT,
	two INT,
	INDEX name_name(name, second_name),
	INDEX name_name_one(name, second_name, one),
	INDEX name_name_two(name, second_name, two)
);
-- 다음과 같이 인덱스를 구성하는 컬럼중 중복이 많고 IN 절에 많은 값을 중복 전달할 때 Index Dive 상황이 발생한다.
SELECT * 
FROM test 
WHERE name IN ("1", "2", ... "150") AND second_name IN ("1", "2", ... "150");

-- 인덱스 강제 지정
-- FORCE : 단일 테이블에 대한 쿼리만 가능, ORDER BY, GROUP BY, DISTINCT 등 함수가 있는 경우 사용 불가능
SELECT * 
FROM test 
WHERE name IN ("1", "2", ... "150") AND second_name IN ("1", "2", ... "150")
FORCE INDEX (name, name);

-- USE : FORCE 옵션과 달리 제약이 없다.
SELECT * 
FROM test 
WHERE name IN ("1", "2", ... "150") AND second_name IN ("1", "2", ... "150")
USE INDEX (name, name);