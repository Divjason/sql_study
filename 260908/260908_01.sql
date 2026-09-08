USE student_db;
SHOW TABLES;
DESC students;
SELECT * FROM students;

SELECT * FROM students
WHERE name LIKE "_a__"; # 총 4개 문자열

SELECT * FROM students
WHERE name LIKE "_____";

SELECT * FROM students
WHERE name NOT LIKE "_____";

# WHERE : 조건절 => 비교 & 논리연산자
# <> !=
# NOT : NULL

# % : 0번 | 1번 이상

SET SQL_SAFE_UPDATES = 0;

UPDATE students SET age = 15, grade = "2학년"
WHERE name = "Jane"; # PK 속성이 적용된 컬럼을 조건으로 사용!

SET SQL_SAFE_UPDATES = 1;





