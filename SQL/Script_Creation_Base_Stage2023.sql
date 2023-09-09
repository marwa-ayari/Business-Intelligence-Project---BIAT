
create table Customer (
	ID_CUSTOMER INTEGER constraint PK_CUSTOMER primary key,
	NAME varchar(40),
	ADRESSE_CUSTOMER varchar(100),
	CODE_POSTAL INTEGER,
	SECTOR INTEGER,
	LIB_SECTOR varchar(40));

alter table Customer add constraint ck_id_customer check (length(CAST(ID_CUSTOMER AS VARCHAR)) = 10);



create table Account (
	ID_ACCOUNT INTEGER constraint PK_ACCOUNT primary key,
	ID_CUSTOMER INTEGER,
	TYPE_COMPTE INTEGER,
	ADRESSE_ACCOUNT varchar(100),
	CODE_POSTAL INTEGER,
	SOLDE_COMPTE NUMERIC(16,3));

alter table Account add constraint ck_id_account check (length(CAST(id_account AS VARCHAR)) = 10);

alter table Account add constraint fk_customer_account foreign key (ID_CUSTOMER) references Customer(ID_CUSTOMER);




create table Mouvement (
	ID_MVT INTEGER constraint PK_MVT primary key,
	ID_ACCOUNT INTEGER,
	DATE_MVT Date,
	MNT_MVT NUMERIC(16,3));

alter table Mouvement add constraint ck_id_mvt check (length(CAST(ID_MVT AS VARCHAR)) = 10);

alter table Mouvement add constraint fk_Mouvement_account foreign key (ID_ACCOUNT) references Account(ID_ACCOUNT);





UPDATE account a
SET solde_compte = (
    SELECT SUM(mnt_mvt)
    FROM mouvement m
    WHERE m.id_account = a.id_account
    GROUP BY m.id_account
)
WHERE a.id_account IN (SELECT id_account FROM account);










