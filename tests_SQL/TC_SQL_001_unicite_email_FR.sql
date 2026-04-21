-- TC_SQL_001 : Validation règle métier - Unicité de l'email
-- Objectif : Vérifier que la table clients rejette les doublons d'email
-- Résultat attendu : 2ème insertion échoue OU une requête détecte le doublon
-- Résultat obtenu : Doublon détecté - voir preuve TC_SQL_001_resultat.png

CREATE TABLE clients_test (
    id INT,
    email VARCHAR(100)
);

INSERT INTO clients_test VALUES (1, 'test@test.com');
INSERT INTO clients_test VALUES (2, 'test@test.com');

SELECT email, COUNT(*) as nb_occurrences
FROM clients_test 
WHERE email = 'test@test.com'
GROUP BY email
HAVING COUNT(*) > 1;
