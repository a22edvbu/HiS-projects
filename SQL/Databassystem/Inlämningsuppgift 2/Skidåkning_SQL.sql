drop database a22edvbu;
create database a22edvbu;
use a22edvbu;

create table skidåkare(
	skidÅNamn0 varchar(20),
    skidÅVikt0 varChar(3),
    primary key(skidÅNamn0)
)engine=InnoDB;
create table tävling(
	tävlingsNamn0 varChar(50),
    tävlingsDatum0 char(8),
    primary key(tävlingsNamn0)
)engine=InnoDB;
create table snö(
	snöTyp0 varChar(12),
    snöLuftF0 varChar(3),
    primary key(snöTyp0)
)engine=InnoDB;
create table väder(
	väderTyp0 varChar(20),
    väderTemp0 int(3),
    primary key(väderTyp0)
)engine=InnoDB; 
create table struktur(
	struktNamn0 varChar (20),
    struktGrovlek0 varChar (4),
    primary key(struktNamn0)
)engine=innodb;
create table valla(
	vallNamn0 varChar(15),
    vallTyp0 varChar(15),
    primary key(vallNamn0)
)engine=InnoDB;
create table skidor(
	skidNr0 int(1),
    skidFabrikat0 varChar(30),
    skidSpann0 varChar(15),
    skidÅNamn1 varchar(20),
    snöTyp1 varChar(12),
    väderTyp1 varChar(20),
    struktNamn1 varChar(20),
    primary key (skidNr0, skidÅNamn1),
    foreign key (skidÅNamn1) references skidåkare(skidÅNamn0),
    foreign key (snöTyp1) references snö(snöTyp0),
    foreign key (väderTyp1) references väder(väderTyp0),
    foreign key (struktNamn1) references struktur(struktNamn0)
)engine=InnoDB;
create table rillverktyg(
	rillVerkFabrikat0 varChar(30),
    kommentar0 varChar(300),
    struktNamn2 varChar(20),
    primary key (rillVerkFabrikat0, struktNamn2),
    foreign key (struktNamn2) references struktur(struktNamn0)
)engine=InnoDB;
create table delta(
	skidÅNamn2 varChar(20),
    tävlingsNamn1 varChar(50),
    primary key (skidÅNamn2, tävlingsNamn1),
    foreign key (skidÅNamn2) references skidåkare(skidÅNamn0),
    foreign key (tävlingsNamn1) references tävling(tävlingsNamn0)
)engine=InnoDB;
create table harVäder(
	tävlingsNamn1 varChar(50),
    väderTyp2 varChar(20),
    harTid0 char(4),
    primary key (tävlingsNamn1, väderTyp2),
    foreign key (tävlingsNamn1) references tävling(tävlingsNamn0),
    foreign key (väderTyp2) references väder(väderTyp0)
)engine=InnoDB;
create table harSnö(
	tävlingsNamn2 varChar(50),
    snöTyp2 varChar(12),
    primary key (tävlingsNamn2, snöTyp2),
    foreign key (tävlingsNamn2) references tävling(tävlingsNamn0),
    foreign key (snöTyp2) references snö(snöTyp0)
)engine=InnoDB;
create table vallad(
	skidÅNamn3 varChar(20),
    skidNr1 int(8),
	vallNamn1 varChar(15),
    primary key (skidÅNamn3, skidNr1, vallNamn1),
    foreign key (skidNr1) references skidor(skidNr0),
    foreign	key	(skidÅNamn3) references skidåkare(skidÅNamn0),
    foreign key (vallNamn1) references valla(vallNamn0)
)engine=InnoDB;

insert into skidåkare(skidÅNamn0, skidÅVikt0) values ('Therese Johaug', '46');
insert into skidåkare(skidÅNamn0, skidÅVikt0) values ('Lars-Åke Bly', '76');
insert into skidåkare(skidÅNamn0, skidÅVikt0) values ('Erik Bly', '67');
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Charlotte Kalla', null);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Markus Hellner', null);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Anna Haag', null);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Emma Wikén', null);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Stina Nilsson', null);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Marit Björgen', null);

insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Mördarbacken', '10012016');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Oberstdorf', '05012016');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Lenzerheide', null);

insert into väder(väderTyp0, väderTemp0) values ('Extremt Kallt', '-20');
insert into väder(väderTyp0, väderTemp0) values ('Strålande solsken', null);
insert into väder(väderTyp0, väderTemp0) values ('Spöregn', null);

insert into struktur(struktNamn0, struktGrovlek0) values ('Grov Julgran', '2mm');
insert into struktur(struktNamn0, struktGrovlek0) values ('Snedskuren', null);

insert into valla(vallNamn0, vallTyp0) values ('Swix KX35', 'Klister');
insert into valla(vallNamn0, vallTyp0) values ('Swix HF8', 'Glid');
insert into valla(vallNamn0, vallTyp0) values ('Swix KX45', 'Fäst');
insert into valla(vallNamn0, vallTyp0) values ('Skigo HF-Gul', null);

insert into väder(väderTyp0, väderTemp0) values ('Regn', '10');

insert into snö(snöTyp0, snöLuftF0) values ('Slask', '100');
insert into snö(snöTyp0, snöLuftF0) values ('Hård', null);
insert into snö(snöTyp0, snöLuftF0) values ('Mjuk', null);

insert into rillverktyg(rillVerkFabrikat0, kommentar0, struktNamn2) values ('Swix', 'Helt otroligt snabb i kallföre', 'Snedskuren');
insert into rillverktyg(rillVerkFabrikat0, kommentar0, struktNamn2) values ('Skigo', null, 'Snedskuren');

insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (3, 'Fischer', 'Klisterskida', 'Markus Hellner', 'Slask', 'Regn', 'Grov Julgran');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, null, null, 'Anna Haag', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (2, 'Wish', 'Hög', 'Anna Haag', null, null, null);
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (3 , 'Fischer', 'Låg', 'Anna Haag', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1 , 'Fischer', 'Låg', 'Emma Wikén', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1 , null, 'Låg', 'Stina Nilsson', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1 , null, null, 'Charlotte Kalla', null, null, null);
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1 , null, null, 'Marit Björgen', 'Slask', null, null);

insert into delta(skidÅNamn2, tävlingsNamn1) values ('Charlotte Kalla', 'Mördarbacken');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Marit Björgen', 'Lenzerheide');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Anna Haag', 'Mördarbacken');

insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Emma Wikén', 1, 'Swix KX35');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Stina Nilsson', 1, 'Swix KX35');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Charlotte Kalla', 1, 'Swix KX45');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Charlotte Kalla', 1, 'Swix HF8');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Marit Björgen', 1, 'Skigo HF-Gul');

insert into harVäder(tävlingsNamn1, väderTyp2, harTid0) values ('Oberstdorf', 'Extremt Kallt', '0800');
insert into harVäder(tävlingsNamn1, väderTyp2, harTid0) values ('Lenzerheide', 'Strålande solsken', '1100');
insert into harVäder(tävlingsNamn1, väderTyp2, harTid0) values ('Lenzerheide', 'Spöregn', '1300');

insert into harSnö(tävlingsNamn2, snöTyp2) values ('Oberstdorf', 'Slask');
insert into harSnö(tävlingsNamn2, snöTyp2) values ('Lenzerheide', 'Hård');			/* Kan inte skilja tid mellan väder, skriv om hur man kan fixa detta i rapport */
insert into harSnö(tävlingsNamn2, snöTyp2) values ('Lenzerheide', 'Mjuk');


select * from delta;