-- TABLE

CREATE TABLE accounts (
    user_id serial PRIMARY KEY,
    username character varying(12),
    city character varying(128),
    transactions_completed integer,
    transactions_attempted integer,
    account_balance numeric(12,2)
);

-- INSERT

INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('shawn', 'chicago', 5, 10, 355.80),
('cherise', 'minneapolis', 9, 9, 4000.00),
('larry', 'minneapolis', 3, 4, 77.01),
('dallas', 'new york', 6, 12, 0.99),
('anthony', 'chicago', 0, 0, 0.00),
('travis', 'miami', 1, 100, 500000.34),
('davey', 'chicago', 9, 99, 98.04),
('ora', 'phoenix', 88, 90, 3.33),
('grace', 'miami', 7, 9100, 34.78),
('hope', 'phoenix', 4, 10, 50.17);




-- SELECT

SELECT * 
FROM accounts;

-- Questions

-- Question #1 Gets all users from Chicago
SELECT * 
FROM accounts
WHERE city = 'chicago';

-- Question #2 Gets all users with usernames that contain the letter 'a'
SELECT *
FROM accounts
WHERE username ILIKE '%a%';

-- Question #3 Gives a new balance of 10.00 for new accouts with balance of 0 and transactions attempted 0
UPDATE accounts 
SET account_balance = 10.00
WHERE account_balance = 0.00 
AND transactions_attempted = 0;

SELECT * 
FROM accounts
WHERE transactions_attempted = 0;

-- Question #4 Gets all users that have 9 or more attempted transactions
SELECT * 
FROM accounts
WHERE transactions_attempted >= 9;

-- Question #5 Gets usernames and account balance of top 3 highest account balances in DESC order
SELECT username, account_balance
FROM accounts
ORDER BY account_balance DESC
LIMIT 3;

-- Question #6 Gets usernames and account balance of 3 lowest account balances
SELECT username, account_balance
FROM accounts
ORDER BY account_balance
LIMIT 3;

-- Question #7 Gets all users with more than 100$ in account balance
SELECT * 
FROM accounts
WHERE account_balance > 100;

-- Question #8 Adds a new user
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance)
VALUES ('philip', 'minneapolis', 4, 4, 750000.73);

SELECT *
FROM accounts
WHERE username = 'philip';

-- Question #9 Deletes users with fewer than 5 transactions in either miami or phoenix
DELETE FROM accounts
WHERE (city = 'miami' 
OR city = 'phoenix')
AND transactions_completed < 5;


SELECT * 
FROM accounts
WHERE (city = 'miami' 
OR city = 'phoenix')
AND transactions_completed < 5;

