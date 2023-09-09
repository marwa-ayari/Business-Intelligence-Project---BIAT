#Soldes globaux par client

select a.id_customer,c.name,sum (a.solde_compte) as "Solde global" from account a 
inner join customer c on(c.id_customer=a.id_customer)
group by (a.id_customer,c.id_customer);






#Nature du compte possedant le plus de depots

1)select id_account,type_compte,solde_compte from account 
where solde_compte=(select max(solde_compte) from account);

2)select id_account,type_compte,solde_compte from account order by solde_compte desc limit 1;






#100 premiers clients ayant le plus de nombre de compte

select c.id_customer,c.name,count(a.id_account) 
as "Nombre de comptes total" from customer c 
inner join account a on (a.id_customer=c.id_customer)
group by (a.id_customer,c.id_customer)
order by count(a.id_account) desc
limit 100;








#100 premiers clients ayant le plus de types de compte différents.

select c.id_customer,c.name,count(distinct(a.type_compte)) 
as "Nombre de type de comptes differents" from customer c 
inner join account a on (c.id_customer=a.id_customer )
group by (a.id_customer,c.id_customer)
order by count(distinct(a.type_compte)) desc
limit 100;







#5 premiers codes postaux les plus utilisés par les customers

select code_postal, count(code_postal) 
as "Nombre de repetition" from customer 
group by code_postal
order by count(code_postal) desc
limit 5;









#5 premiers codes postaux les plus utilisés par les customers et les accounts


SELECT CODE_POSTAL, COUNT(*)
FROM (
    SELECT CODE_POSTAL FROM Customer
    UNION ALL
    SELECT CODE_POSTAL FROM Account
) as liste_codes
GROUP BY CODE_POSTAL
ORDER BY count(*) DESC
LIMIT 5;











#liste des clients les plus mouvementés 

select  c.id_customer ,c.name, count(m.id_mvt) 
as "total mouvements" from customer c 
inner join account a on (a.id_customer=c.id_customer)
inner join mouvement m on (m.id_account=a.id_account)
group by (c.id_customer,a.id_customer)
order by count(id_mvt) desc;



#liste des clients débiteurs

select c.id_customer, c.name, sum(a.solde_compte) 
as "Solde total des comptes" 
from customer c inner join account a 
on(a.id_customer=c.id_customer)
group by (c.id_customer,a.id_customer)
having (sum(solde_compte)) < 0 ;






