/*******************************************************************************
**********************    SPLIT_PART, CONCAT et TRANSLATE   ********************
********************************************************************************/

-- Va chercher la valeur dans le tableau propos�: 

SELECT SPLIT_PART('A,B,C', ',', 2)

-- CONCAT va concatener une chaine de caractere 

SELECT concat('w',3,'r', 'esource','.','com');

-- La fonction translate () de PostgreSQL est utilis�e pour traduire n'importe quel caract�re de la cha�ne par un caract�re dans replace_string

SELECT translate('translate', 'rnlt', '123')

-- https://w3resource.com/PostgreSQL/translate-function.php