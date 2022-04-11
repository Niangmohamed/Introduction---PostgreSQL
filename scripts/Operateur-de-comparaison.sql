/***********************************************************************************
*********     Les Operateurs de comparaison et DISTINCT        **********************
************************************************************************************/

-- Que donne le select de la table contact

select * from contact 

--Je veux selectionner l'age des contacts qui ont moins de 22 ans

select * from contact where age < 22

--Je veux selectionner l'age des contacts qui ont �gal ou moins de 22 ans 

select * from contact where age <= 22

--Je veux selectionner l'age des contacts qui sont sup�rieurs a 34 ans

select * from contact where age > 34

--Je veux selectionner l'age des contacts qui sont sup�rieurs ou egal a 34 ans

select * from contact where age >= 34

--Je veux selectionner l'age des contacts qui sont diff�rents de 41 ans

select * from contact where age <> 41

--On peut le faire aussi par cet op�rateur !=

select * from contact where age != 41

-- le DISTINCT va enlever les doublons dans la table

-- Refaisons un select de la table contact

select * from contact

-- Si on regarde bien j'ai deux valeurs Virenque dans ma table

select nom from contact where nom ='Virenque'

--selectionner juste la premiere ligne

select distinct nom from contact where nom ='Virenque'




