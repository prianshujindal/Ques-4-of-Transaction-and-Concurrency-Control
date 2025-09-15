DROP TABLE IF EXISTS StudentEnrollments;

CREATE TABLE StudentEnrollments (
    enrollment_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course_id VARCHAR(10),
    enrollment_date DATE,
    CONSTRAINT unique_enrollment UNIQUE(student_name, course_id)
);

INSERT INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (1, 'Ashish', 'CSE101', '2024-07-01');

INSERT INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (2, 'Smaran', 'CSE102', '2024-07-01');

INSERT INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (3, 'Vaibhav', 'CSE101', '2024-07-01');

INSERT IGNORE INTO StudentEnrollments (enrollment_id, student_name, course_id, enrollment_date)
VALUES (4, 'Ashish', 'CSE101', '2024-07-02');

START TRANSACTION;
SELECT * FROM StudentEnrollments 
WHERE student_name = 'Ashish' AND course_id = 'CSE101'
FOR UPDATE;

START TRANSACTION;
UPDATE StudentEnrollments 
SET enrollment_date = '2024-07-10'
WHERE student_name = 'Ashish' AND course_id = 'CSE101';
COMMIT;
