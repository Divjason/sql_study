# 인덱스 = Index
# 사전 => 영어사전, 국어사전
# 찾고자 하는 단어 [단어] : 발음 : 단어활용 문장 예시
# apple
# a ~ z : 영단어가 오름차순
# b라는 알파벳으로 시작하는 단어보다는 무조건 앞쪽에 있다.
# 인덱싱 // 규칙을 가지고 있는 저장소에서 어떤 값을 찾는 행위
# 인덱스 // 해당 저장소가 가지고 있는 규칙
# Excel, 데이터 저장 -> MySQL, 엄청나게 방대한 데이터
# 10만, 100만개, 1000만개

DROP DATABASE sqlDB;

CREATE DATABASE IF NOT EXISTS sqlDB;

SHOW DATABASES;

USE sqlDB;

DROP TABLE userTbl;

# 초기 테이블 생성 코드
CREATE TABLE userTbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr VARCHAR(4) NOT NULL,
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDate DATE
);

# 인덱스 생성용 테이블 코드
CREATE TABLE userTbl (
	userID CHAR(8) NOT NULL PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    birthYear INT NOT NULL,
    addr VARCHAR(4) NOT NULL,
    mobile1 CHAR(3),
    mobile2 CHAR(8),
    height SMALLINT,
    mDate DATE,
    UNIQUE INDEX idx_userTbl_name (name),
    INDEX idx_userTbl_addr (addr)
);

ALTER TABLE userTbl MODIFY COLUMN userID VARCHAR(8);
ALTER TABLE userTbl CHANGE COLUMN name userName VARCHAR(10) NOT NULL;

SHOW TABLES;

DESC userTbl;

# 특정 테이블 안에 인덱스 값을 조회해서 나에게 보여줘.
SHOW INDEX FROM userTbl;

# Non_unique : 중복값 허용여부 : 0 = 중복불가 선언 

# 인덱스가 무엇인가?
# 인덱스를 왜 사용하는가?
# 식별키 = PRIMARY KEY 설정 = 인덱스
# 복합인덱스 = 어떤 값을 조회, 조건 WHERE age = 16 AND grade = "2학년"
# 이왕이면 인덱스설정, 단일값 = 유저아이디 하나만 인덱스
# age, grade = 한번에 묶어서 = 결합해서 인덱스
# 16, 3학년
# 16, 3학년
# age 1 // grade 2
# Collation = 정렬 = A
# BTREE = Balanced Tree

CREATE TABLE buyTbl (
	num INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    userID CHAR(8) NOT NULL,
    prodName CHAR(4),
    groupName CHAR(4),
    price INT NOT NULL,
    amount SMALLINT NOT NULL,
    FOREIGN KEY (userID) REFERENCES userTbl(userID)
);

SHOW INDEX FROM buyTbl;

# userID 컬럼을 기준으로 2개의 테이블은 서로 연결할 수 있는 상태
# userTbl : 사용자의 정보 존재 : A, B, C, D
# buyTbl : 특정 사용자가 상품을 구매할 때마다 값이 생성되는 테이블 :
# A : 001 / 003 / 004 / 007

# 클러스터 인덱스 : 클러스터 = 부동산 시장 = 군집

# PRIMARY KEY => 테이블안에 어떤 값이 삽입되던지 무조건 해당 테이블 내 값을 식별할 수 있도록
# 태생부터 인덱스의 역할 부여

# 보조 인덱스 => 테이블 내 클러스터 인덱스 외에 추가적으로 인덱스의 역할을 부여받은 요소

DESC userTbl;

ALTER TABLE userTbl ADD CONSTRAINT TESTDate UNIQUE(mDate);

SHOW INDEX FROM userTbl;

CREATE INDEX idx_name ON userTbl(name);

# 인덱스를 부여하는 방법
# 1) 프라이머리키 적용 : PRIMARY KEY
# 2) 외래키 적용 : FOREIGN KEY
# 3) 유니크 값 적용 : ALTER TABLE ADD CONSTRAINT UNIQUE()
# 4) 인덱스 키 생성 : CREATE INDEX
# 5) 인덱스 키 적용 : ALTER TABLE ADD INDEX

ALTER TABLE userTbl ADD INDEX idx_addr(addr);
# 인덱스가 나름 중요 : 체감? // 최소한의 Data : 50만개 이상

ALTER TABLE userTbl DROP INDEX idx_userTbl_name;
ALTER TABLE userTbl DROP INDEX idx_userTbl_addr;
SHOW INDEX FROM userTbl;



