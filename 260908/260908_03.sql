# MySQL 프로그램 설치 > 가입 > 로그인
# CMD > Workbench 쿼리문을 작성 조회. 사용
# 변수 > 시스템환경변수 > 고급탭 선택 > ...

# CMD > MySQL Shell > DCL 문법을 사용할 수 있는 권한

# 로컬(내 컴퓨터)에서 접속 가능한 사용자
CREATE USER 'david'@'localhost' IDENTIFIED BY '1234';

# 로컬컴퓨터의 hostname, port 아닌 경우에도 접속할 수 있는 사용자
CREATE USER 'davidGlobal'@'%' IDENTIFIED BY '1234';

# 클라우드 컴퓨팅
# 과거 > 어떤 사이트 접속 : 반드시 서버 개념 // 서버실
# 서버 > 취급하는 데이터 접속량 > 사이즈 (공간)
# 화재, 재난 > 서버 물리적 공격
# 가상공간 > DB > 데이터
# MySQL > AWS : EC2 // Azure // Firebase

USE student_db;

SELECT host, user FROM mysql.user;

SET PASSWORD FOR 'david'@'localhost' = '12345';

DROP USER 'david'@'localhost';

SHOW GRANTS FOR 'davidGlobal'@'%';

GRANT SELECT ON student_db.students TO 'davidGlobal'@'%';
# 특정 권한만 허용하고자 할 때
# GRANT INSERT, SELECT, UPDATE ON DB이름.테이블이름 TO 'userid'@'host';
# GRANT ALL ON DB이름.* TO 'userid'@'host';

GRANT ALL ON *.* TO 'davidGlobal'@'%';

REVOKE SELECT ON student_db.students
FROM 'davidGlobal'@'%';

REVOKE ALL PRIVILEGES, GRANT OPTION
FROM 'davidGlobal'@'%';

# SQL 기본 개념 // 기본 문법
# Sakila
# 다양한 문법
# 실제 사이트에서 데이터 수집 + MySQL 저장

USE sakila;

SELECT * FROM film LIMIT 10;

SELECT COUNT(*) FROM film;
# 경쟁사 사이트 크롤링 : 상품개수

SELECT COUNT(*) FROM category;

SELECT
	customer_id,
    SUM(amount) AS total_revenue
FROM payment
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

DROP DATABASE wconcept_260909;

