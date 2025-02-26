CREATE DATABASE bank;
USE bank;
CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    balance DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;  -- Ensure InnoDB for transactions
-- INSERT INTO accounts (name, balance) VALUES ('Alice', 5000);
-- INSERT INTO accounts (name, balance) VALUES ('Bob', 3000);
-- SELECT * FROM accounts;

-- UPDATE accounts SET balance = balance +10000 WHERE account_id = 1;  -- Deduct 1000 from Alice
-- UPDATE accounts SET balance = balance + 1000 WHERE account_id = 2;  -- Add 1000 to Bob

-- START TRANSACTION;

-- UPDATE accounts SET balance = balance - 1000 WHERE account_id = 1;
-- UPDATE accounts SET balance = balance + 1000 WHERE account_id = 2;

-- COMMIT;  -- Saves the changes permanently

-- START TRANSACTION;

-- UPDATE accounts SET balance = balance - 2000 WHERE account_id = 1;
-- UPDATE accounts SET balance = balance + 2000 WHERE account_id = 2;

-- ROLLBACK;  

-- SELECT * FROM accounts;

-- START TRANSACTION;

-- UPDATE accounts SET balance = balance - 500 WHERE account_id = 1;
-- SAVEPOINT first_update;

-- UPDATE accounts SET balance = balance + 500 WHERE account_id = 2;
-- SAVEPOINT second_update;

-- ROLLBACK TO first_update;  -- Undo second update only

-- COMMIT;

SET AUTOCOMMIT = 0;  -- Turns off auto-commit
START TRANSACTION;

UPDATE accounts SET balance = balance - 300 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 300 WHERE account_id = 2;

COMMIT;

SELECT * FROM accounts;

START TRANSACTION;

insert into accounts(account_id, name, balance) values (3,'nisha', 2000); 
UPDATE accounts SET balance = balance - 300 WHERE account_id = 4;


SET AUTOCOMMIT =0;
START TRANSACTION;

insert into accounts(name, balance) values ('neha', 200); 
UPDATE accounts SET balance = balance - 300 WHERE account_id = 8;

COMMIT;

-- class 2 

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

insert into accounts(name, balance) values ('neha', 200); 
UPDATE accounts SET balance = balance - 300 WHERE account_id = 8;

COMMIT;

SELECT * FROM accounts;

-- shared locks

SELECT * FROM accounts
WHERE account_id = 1
lock in share mode;

-- Ecxclusive locks
SELECT * FROM accounts
WHERE account_id = 1
FOR UPDATE;



