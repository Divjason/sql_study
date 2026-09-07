# DB -> Table -> Schema -> Modify / Change -> Insert -> Update
# Data x

CREATE DATABASE student_db01;
USE student_db01;


CREATE TABLE students (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    age INT UNSIGNED,
    grade VARCHAR(10)
);

SELECT * FROM students;

INSERT INTO students (name, age)
VALUES ('David', 20);

INSERT INTO students VALUES(1, "David", 15, "2학년");

INSERT INTO students (name, age, grade)
VALUES("Dave", 16, "3학년");

INSERT INTO students (name, age, grade)
VALUES
	("Jane", 14, "1학년"),
    ("Juliet", 15, "2학년"),
    ("Romeo", 16, "3학년");

SELECT * FROM students;

UPDATE students
SET grade = "2학년", age = 15
WHERE id = 3;

# MySQL 프로그램 설치 > 구글 포털

UPDATE students
SET grade = "3학년", age = 16;


SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE students
SET grade = "1학년", age = 14
WHERE grade = "2학년" AND age = 15;

# DB -> Table -> Schema -> Modify / Change -> Insert -> Update -> SELECT

SELECT * FROM students; # * = all
SELECT * FROM students WHERE age >= 15; # where = 조건절
SELECT * FROM students WHERE age <> 15;
# 조건절 : 비교연산자 & 논리연산자
# 비교연산자 : = >= <= > < != <>
# 1 == "1" // 1 === "1"

SELECT * FROM students WHERE NOT age = 16;
# NOT -> 연산자 x, 예약어 > 논리 부정 키워드
# 단순 부정연산을 위한 목적보다, NULL의 연산처리를 위한 목적
# IS NOT NULL

SELECT * FROM students WHERE age IS NOT NULL;
SELECT * FROM students WHERE age <> NULL;

SELECT * FROM students
WHERE (age > 15 AND grade = "3학년") OR grade = "1학년";
# AND : 좌항 AND 우항 -> 좌항도 True / 우항도 True

SELECT * FROM students
WHERE name LIKE "D%"; # % => 0개 혹은 그 이상의 존재 = 1개 정의

SELECT * FROM students
WHERE name LIKE "%D%";









