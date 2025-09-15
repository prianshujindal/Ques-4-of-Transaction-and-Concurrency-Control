DROP TABLE IF EXISTS FeePayments;

-- Create table
CREATE TABLE FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE NOT NULL
);


START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (1, 'Ashish', 5000.00, '2024-06-01');

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (2, 'Smaran', 4500.00, '2024-06-02');

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (3, 'Vaibhav', 5500.00, '2024-06-03');

COMMIT;

SELECT 'Part A: After successful commit' AS info;
SELECT * FROM FeePayments;


START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (4, 'Kiran', 4800.00, '2024-06-04');

-- This will fail due to duplicate payment_id = 1
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (1, 'Ashish', 5000.00, '2024-06-05');

-- Rollback the transaction
ROLLBACK;

SELECT 'Part B: After rollback due to duplicate ID' AS info;
SELECT * FROM FeePayments;


START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (5, 'Rohan', 5200.00, '2024-06-06');

-- This will fail due to NULL student_name
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (6, NULL, 5000.00, '2024-06-07');

-- Rollback the transaction
ROLLBACK;

SELECT 'Part C: After rollback due to NULL student_name' AS info;
SELECT * FROM FeePayments;


START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (7, 'Anita', 5300.00, '2024-06-08');

-- This will fail due to duplicate payment_id = 2
INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (2, 'Smaran', 4500.00, '2024-06-09');

ROLLBACK;

SELECT 'Part D: After rollback of first transaction' AS info;
SELECT * FROM FeePayments;

-- Second transaction: valid inserts only
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (8, 'Neha', 4900.00, '2024-06-10');

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date)
VALUES (9, 'Rahul', 5100.00, '2024-06-11');

COMMIT;

SELECT 'Part D: Final state after all transactions' AS info;
SELECT * FROM FeePayments;