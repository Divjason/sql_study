DROP DATABASE student_db;

DELETE FROM students;

DELETE FROM students WHERE name = "David";

DESC students;

TRUNCATE TABLE students;
# 기존 테이블 구조는 유지하면서 값만 제거

# Error Code: 1175.
# You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
