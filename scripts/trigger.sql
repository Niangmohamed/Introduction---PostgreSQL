/*******************************************************************************
********************** Les TRIGGERS      ***************************************
********************************************************************************/

-- Un d�clencheur (trigger) PostgreSQL est une fonction invoqu�e automatiquement chaque fois qu'un �v�nement associ� 
-- � une table se produit. Un �v�nement peut �tre l'un des suivants: INSERT , UPDATE , DELETE ou TRUNCATE .

-- Un d�clencheur est une fonction sp�ciale d�finie par l'utilisateur associ�e � une table.

-- Pour cr�er un nouveau d�clencheur, vous devez d'abord d�finir une fonction de d�clencheur, puis lier cette fonction de d�clencheur � une table.

-- Tout d'abord, cr�ez une fonction de d�clenchement � l'aide de CREATE FUNCTION
-- Ensuite liez la fonction au trigger

-- Creation de deux tables : 

-- Creation de la table employ� ; 

CREATE TABLE employees(
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(40) NOT NULL,
   last_name VARCHAR(40) NOT NULL
);

-- Creation de la table des audits des employ�s (avec une colonne en date):
CREATE TABLE employee_audits (
   id SERIAL PRIMARY KEY,
   employee_id INT NOT NULL,
   last_name VARCHAR(40) NOT NULL,
   changed_on TIMESTAMP(6) NOT NULL
)

-- Creation de la fonction : 

CREATE or REPLACE FUNCTION log_last_name_changes() RETURNS trigger AS $emp_stamp$
    BEGIN
   IF NEW.last_name <> OLD.last_name THEN -- Si la colonne last_name ne matche pas
       INSERT INTO employee_audits(employee_id,last_name,changed_on)-- Insertion dans la table d'audit
       VALUES(OLD.id,OLD.last_name,now());--lancienne valeur de la colonne ID, de last name et a la date du jour 
   END IF;--Fin du IF
        RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;

-- Creation du trigger : 

CREATE  TRIGGER last_name_changes
  BEFORE UPDATE --avant la MAJ
  ON employees -- sur la table employ�
  FOR EACH ROW -- pour chaque ligne 
  EXECUTE PROCEDURE log_last_name_changes();-- Execute la fonction 
 
 -- Insertion de deux valeurs : 
 
 INSERT INTO employees (first_name, last_name)
VALUES ('John', 'Doe');
 
INSERT INTO employees (first_name, last_name)
VALUES ('Lily', 'Brown');


-- que donne le SELECT : 

SELECT * FROM employees

-- Supposons que cela Lily Bushse marie et qu'elle doive changer son nom de famille en Lily Brown. 
-- Nous pouvons mettre � jour son nom de famille comme indiqu� dans la requ�te suivante:

UPDATE employees
SET last_name = 'TOTO'
WHERE ID = 2;

-- que donne le SELECT : 

SELECT * FROM employees

-- Comme vous pouvez le voir sur la sortie, le nom de famille de Lily a �t� mis � jour. V�rifions le contenu du employee_audits tableau:

SELECT *
FROM employee_audits;

  