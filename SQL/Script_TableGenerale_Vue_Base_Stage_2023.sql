#Création d'une table contenant l'ensemble des donées customer, account et mouvement

create table Table_Ensemble as (
		select 
		c.id_customer ,c.name ,c.adresse_customer ,c.code_postal 
		as "code_postal_customer", c.sector ,c.lib_sector ,
		a.id_account ,a.type_compte ,a.adresse_account ,a.code_postal 
		as "code_postal_account" ,a.solde_compte ,
		m.id_mvt ,m.date_mvt ,m.mnt_mvt 
		from customer c
		inner join account a on(a.id_customer=c.id_customer)
		inner join mouvement m on(m.id_account=a.id_account));

create view Vue_Ensemble as (select * from Table_Ensemble);

