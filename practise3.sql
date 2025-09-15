DROP TABLE IF EXISTS StudentEnrollments;

CREATE TABLE StudentEnrollments (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course_id VARCHAR(10),
    enrollment_date DATE
);

INSERT INTO StudentEnrollments VALUES
(1, 'Ashish', 'CSE101', '2024-06-01'),
(2, 'Smaran', 'CSE102', '2024-06-01'),
(3, 'Vaibhav', 'CSE103', '2024-06-01');

START TRANSACTION;
UPDATE StudentEnrollments SET enrollment_date = '2024-07-01' WHERE student_id = 1;
UPDATE StudentEnrollments SET enrollment_date = '2024-07-02' WHERE student_id = 2;

START TRANSACTION;
UPDATE StudentEnrollments SET enrollment_date = '2024-07-02' WHERE student_id = 2;
UPDATE StudentEnrollments SET enrollment_date = '2024-07-01' WHERE student_id = 1;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM StudentEnrollments WHERE student_id = 1;

START TRANSACTION;
UPDATE StudentEnrollments SET enrollment_date = '2024-07-10' WHERE student_id = 1;
COMMIT;

SELECT * FROM StudentEnrollments WHERE student_id = 1;
COMMIT;

START TRANSACTION;
SELECT * FROM StudentEnrollments WHERE student_id = 1 FOR UPDATE;

UPDATE StudentEnrollments SET enrollment_date = '2024-08-01' WHERE student_id = 1;

SET SESSION TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM StudentEnrollments WHERE student_id = 1;

UPDATE StudentEnrollments SET enrollment_date = '2024-08-01' WHERE student_id = 1;
COMMIT;
