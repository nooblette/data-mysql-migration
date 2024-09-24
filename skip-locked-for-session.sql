-- 다음과 같이 row lock을 거는 조회 쿼리가 여러개 수행되면 다른 세션에서 Lock wait time out ~~~ try agin 에러가 발생할 수 있다.
SELECT * FROM test WHERE name = "july" ORDER BY id LIMIT 3 FOR UPDATE;

-- 다음과 같이 skipped lock을 두면 Lock이 걸려있는 로우는 반환하면서 에러를 방지할 수 있다.
SELECT * FROM test WHERE name = "july" ORDER BY id LIMIT 3 FOR UPDATE SKIP LOCKED;

-- 티켓팅 테이블 생성
CREATE TABLE ticket	(
	seq BIGINT,
    name VARCHAR(255)
);
-- 테스트를 위한 row 생성
INSERT ticket(seq, name)
VALUES (1, "ax");

-- 세션 시작
BEGIN;
SELECT * FROM ticket WHERE name = "ax" ORDER BY seq LIMIT 3 FOR UPDATE;

-- 세션 종료
COMMIT;