/*******************************************************************************
********************** TRIM LTRIM RTRIM     ************************************
********************************************************************************/
-- Supprime le caract�re sp�cifi� au d�but ou � la fin d�une cha�ne.
--- a gauche ? 

select LTRIM('entreprise','e') 

--- a droite ? 

select RTRIM('entreprise','e')


--- des deux cot�s  ? 

select BTRIM('entreprise','e')

-- Ou 

select btrim('xyxtrimyyx', 'xy')

/*******************************************************************************
********************** UPPER LOWER      ***************************************
********************************************************************************/

--  permet de transformer un texte en minuscule et en MAJUSCULE :

-- Mettons la colonne nom en Majuscule : 

select upper(nom) from contact

-- et en minuscule 

select lower(nom) from contact