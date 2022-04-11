/******************************************************************************
****************       ORDER BY et BETWEEN       ******************************
*******************************************************************************/

-- Cela permet de trier les lignes dans un r�sultat d�une requ�te SQL. 
-- Il est possible de trier les donn�es sur une ou plusieurs colonnes, par ordre ascendant ou descendant.		

-- Je veux trier les ages du plus petit au plus grand 

select * from contact order by age asc

-- Et du plus grand au plus petit

 select * from contact order by age desc

 -- Si je veux trier par nom ? 

  select * from contact order by nom desc

 -- Si je veux trier juste par l'ann�e de la date de naissance ? 

   select * from contact order by date_de_naissance 
 
 -- on peut s'apercevoir que c'est l'ascendant qui est par defaut sur SQL

 -- Et si j'essaye de facon descendante (du plus grand au plus petit)

    select * from contact order by date_de_naissance desc

-- BETWEEN 
-- L�op�rateur BETWEEN est utilis� dans une requ�te SQL pour s�lectionner un intervalle de donn�es dans une requ�te utilisant WHERE.

select  *  from contact where age between 16 and 33 order by age asc

-- cela marche par contre avec le NOT 

select * from contact where age not between 16 and 33 order by age asc