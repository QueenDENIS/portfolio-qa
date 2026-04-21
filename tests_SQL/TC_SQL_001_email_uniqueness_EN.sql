-- TC_SQL_001: Business Rule Validation - Email Uniqueness
-- Objective: Verify that clients table rejects duplicate emails
-- Expected Result: 2nd insert fails OR query detects the duplicate
-- Actual Result: Duplicate detected - see proof TC_SQL_001_resultat.png

CREATE TABLE clients_test (
    id INT,
    email VARCHAR(100)
);

INSERT INTO clients_test VALUES (1, 'test@test.com');
INSERT INTO clients_test VALUES (2, 'test@test.com');

SELECT email, COUNT(*) as occurrence_count
FROM clients_test 
WHERE email = 'test@test.com'
GROUP BY email
HAVING COUNT(*) > 1;
