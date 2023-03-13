drop database a22edvbu;
create database a22edvbu;
use a22edvbu;

create table skidåkare(
	skidÅNamn0 varchar(20),
    skidÅVikt0 int(3),
    primary key(skidÅNamn0)
)engine=InnoDB;
create table tävling(
	tävlingsNamn0 varChar(50),
    tävlingsDatum0 date,
    primary key(tävlingsNamn0)
)engine=InnoDB;
create table snö(
	snöTyp0 varChar(12),
    snöLuftF0 int(3),
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
    foreign key (skidÅNamn1) references skidåkare(skidÅNamn0)  ON DELETE CASCADE, 
    foreign key (snöTyp1) references snö(snöTyp0)  ON DELETE CASCADE,
    foreign key (väderTyp1) references väder(väderTyp0)  ON DELETE CASCADE,
    foreign key (struktNamn1) references struktur(struktNamn0)  ON DELETE CASCADE
)engine=InnoDB;
create table rillverktyg(
	rillVerkFabrikat0 varChar(30),
    kommentar0 varChar(50),
    struktNamn2 varChar(20),
    primary key (rillVerkFabrikat0, struktNamn2),
    foreign key (struktNamn2) references struktur(struktNamn0) ON DELETE CASCADE
)engine=InnoDB;
create table delta(
	skidÅNamn2 varChar(20),
    tävlingsNamn1 varChar(50),
    primary key (skidÅNamn2, tävlingsNamn1),
    foreign key (skidÅNamn2) references skidåkare(skidÅNamn0)  ON DELETE CASCADE,
    foreign key (tävlingsNamn1) references tävling(tävlingsNamn0)  ON DELETE CASCADE
)engine=InnoDB;
create table harVäder(
	tävlingsNamn3 varChar(50),
    väderTyp2 varChar(20),
    harTid0 int(4),
    primary key (tävlingsNamn3, väderTyp2),
    foreign key (tävlingsNamn3) references tävling(tävlingsNamn0)  ON DELETE CASCADE,
    foreign key (väderTyp2) references väder(väderTyp0)  ON DELETE CASCADE
)engine=InnoDB;
create table harSnö(
	tävlingsNamn2 varChar(50),
    snöTyp2 varChar(12),
    primary key (tävlingsNamn2, snöTyp2),
    foreign key (tävlingsNamn2) references tävling(tävlingsNamn0)  ON DELETE CASCADE,
    foreign key (snöTyp2) references snö(snöTyp0)  ON DELETE CASCADE
)engine=InnoDB;
create table vallad(
	skidÅNamn3 varChar(20),
    skidNr1 int(8),
	vallNamn1 varChar(15),
    primary key (skidÅNamn3, skidNr1, vallNamn1),
    foreign key (skidNr1) references skidor(skidNr0) ON DELETE CASCADE,
    foreign	key	(skidÅNamn3) references skidåkare(skidÅNamn0)  ON DELETE CASCADE,
    foreign key (vallNamn1) references valla(vallNamn0)  ON DELETE CASCADE
)engine=InnoDB;

insert into skidåkare(skidÅNamn0, skidÅVikt0) values ('Therese Johaug', 46);
insert into skidåkare(skidÅNamn0, skidÅVikt0) values ('Lars-Åke Bly', 76);
insert into skidåkare(skidÅNamn0, skidÅVikt0) values ('Erik Bly', 67);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Charlotte Kalla', 51);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Markus Hellner', 59);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Anna Haag', 76);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Emma Wikén', 86);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Stina Nilsson', 76);
insert into skidåkare(skidÅNamn0, skidÅvikt0) values ('Marit Björgen', 67);

insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Mördarbacken', '2016-01-10');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Oberstdorf', '2016-01-05');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Lenzerheide', '2016-12-07');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Tour de Ski 2017', '2017-02-15');			# Var tvungen att lägga till årtal för att göra nycklarna unika!
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Tour de Ski 2018', '2018-03-15');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Tour de Ski 2019', '2019-02-16');
insert into tävling(tävlingsNamn0, tävlingsDatum0) values ('Tour de Ski 2020', '2020-05-15');

insert into väder(väderTyp0, väderTemp0) values ('Extremt kallt', '-20');
insert into väder(väderTyp0, väderTemp0) values ('Strålande solsken', 15);
insert into väder(väderTyp0, väderTemp0) values ('Spöregn', 2);
insert into väder(väderTyp0, väderTemp0) values ('Regn', '10');

insert into struktur(struktNamn0, struktGrovlek0) values ('Grov Julgran', '2mm');
insert into struktur(struktNamn0, struktGrovlek0) values ('Snedskuren', null);

insert into valla(vallNamn0, vallTyp0) values ('Swix KX35', 'Klister');
insert into valla(vallNamn0, vallTyp0) values ('Swix HF8', 'Glid');
insert into valla(vallNamn0, vallTyp0) values ('Swix KX45', 'Fäst');
insert into valla(vallNamn0, vallTyp0) values ('Skigo HF-Gul', null);

insert into snö(snöTyp0, snöLuftF0) values ('Slask', 100);
insert into snö(snöTyp0, snöLuftF0) values ('Stenhård', null);
insert into snö(snöTyp0, snöLuftF0) values ('Mjuk', null);
insert into snö(snöTyp0, snöLuftF0) values ('Lös', null);
insert into snö(snöTyp0, snöLuftF0) values ('Kram', null);

insert into rillverktyg(rillVerkFabrikat0, kommentar0, struktNamn2) values ('Swix', 'Helt otroligt snabb i kallföre', 'Snedskuren');
insert into rillverktyg(rillVerkFabrikat0, kommentar0, struktNamn2) values ('Skigo', 'Bra', 'Snedskuren');
insert into rillverktyg(rillVerkFabrikat0, kommentar0, struktNamn2) values ('Madhus', 'Rolig', 'Snedskuren');
insert into rillverktyg(rillVerkFabrikat0, kommentar0, struktNamn2) values ('Wish', 'Dålig', 'Snedskuren');

insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, 'Fischer', 'Låg', 'Markus Hellner', 'Mjuk', 'Regn', 'Grov Julgran');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (2, 'Madhus', 'Hög', 'Markus Hellner', 'Slask', 'Regn', 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (3, 'Fischer', 'Klisterskida', 'Markus Hellner', 'Slask', 'Regn', 'Grov Julgran');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, null, null, 'Anna Haag', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (2, 'Wish', 'Hög', 'Anna Haag', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (3, 'Fischer', 'Låg', 'Anna Haag', null, null, 'Grov Julgran');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, 'Fischer', 'Låg', 'Emma Wikén', null, null, 'Grov Julgran');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, null, 'Låg', 'Stina Nilsson', null, null, 'Grov Julgran');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, null, null, 'Charlotte Kalla', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (2, 'Madhus', null, 'Charlotte Kalla', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
			values (1, 'Madhus', null, 'Lars-Åke Bly', null, null, 'Snedskuren');
insert into skidor(skidNr0, skidFabrikat0, skidSpann0, SkidÅNamn1, snöTyp1, väderTyp1, struktNamn1) 
            values (1, null, null, 'Marit Björgen', 'Slask', null, 'Snedskuren');

insert into delta(skidÅNamn2, tävlingsNamn1) values ('Charlotte Kalla', 'Mördarbacken');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Marit Björgen', 'Lenzerheide');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Anna Haag', 'Mördarbacken');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Anna Haag', 'Lenzerheide');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Anna Haag', 'Oberstdorf');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Lars-Åke Bly', 'Oberstdorf');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Lars-Åke Bly', 'Lenzerheide');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Markus Hellner', 'Lenzerheide');
insert into delta(skidÅNamn2, tävlingsNamn1) values ('Markus Hellner', 'Mördarbacken');

insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Emma Wikén', 1, 'Swix KX35');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Stina Nilsson', 1, 'Swix KX35');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Charlotte Kalla', 1, 'Swix KX45');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Charlotte Kalla', 1, 'Swix HF8');
insert into vallad(skidÅNamn3, skidNr1, vallNamn1) values ('Marit Björgen', 1, 'Skigo HF-Gul');

insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Oberstdorf', 'Extremt kallt', 0800);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Lenzerheide', 'Strålande solsken', 1100);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Lenzerheide', 'Extremt kallt', 1200);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Lenzerheide', 'Spöregn', 1300);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Mördarbacken', 'Spöregn', 0800);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Mördarbacken', 'Extremt kallt', 0900);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Mördarbacken', 'Strålande solsken', 1000);
insert into harVäder(tävlingsNamn3, väderTyp2, harTid0) values ('Mördarbacken', 'Regn', 1100);

insert into harSnö(tävlingsNamn2, snöTyp2) values ('Oberstdorf', 'Slask');
insert into harSnö(tävlingsNamn2, snöTyp2) values ('Lenzerheide', 'Stenhård');			/* Kan inte skilja tid mellan väder, skriv om hur man kan fixa detta i rapport */
insert into harSnö(tävlingsNamn2, snöTyp2) values ('Lenzerheide', 'Mjuk');
insert into harSnö(tävlingsNamn2, snöTyp2) values ('Mördarbacken', 'Slask');

# Uppgift 1
select skidåkare.skidÅVikt0 as "Vikt", skidåkare.skidÅNamn0 as "Skidåkare"
from skidåkare
where skidåkare.skidÅNamn0 = "Therese Johaug";

# Uppgift 2
select tävling.tävlingsNamn0 as "Tävling", tävlingsDatum0 as "Datum"
from tävling
where tävling.tävlingsNamn0 = "Mördarbacken";

# Uppgift 3
select skidåkare.skidÅVikt0 as "Vikt"
from skidåkare, delta, tävling
where skidåkare.skidÅNamn0 = delta.skidÅNamn2 and delta.tävlingsNamn1 = tävling.tävlingsNamn0 and tävling.tävlingsDatum0 = "2016-01-05";

# Uppgift 4 
select skidor.skidÅNamn1 as "Skidåkare"
from skidor
where skidor.skidNr0 = 3 and skidor.skidFabrikat0 = 'Madhus' and skidor.struktNamn1 = 'Snedskuren';

# Uppgift 5 
select harVäder.väderTyp2
from harVäder, delta, skidor
where delta.skidÅNamn2 = 'Markus Hellner' and harVäder.tävlingsNamn3 = 'Lenzerheide' and harVäder.harTid0 = 1200 and skidor.skidNr0 = 2 and skidor.skidÅNamn1 = delta.skidÅNamn2 and delta.tävlingsNamn1 = harVäder.tävlingsNamn3;

# Uppgift 6
select distinct skidåkare.skidÅNamn0
from skidåkare, skidåkare Temp																						
where skidåkare.skidÅVikt0 = Temp.skidÅVikt0 and skidåkare.skidÅNamn0 != Temp.skidÅNamn0;

# Uppgift 7 
select skidåkare.skidÅNamn0
from skidåkare
where not exists (select * from delta where skidåkare.skidÅNamn0 = delta.skidÅNamn2);

#Uppgift 8
select tävling.tävlingsNamn0
from tävling
where not exists (
	select * 
    from väder 
    where not exists (
		select * 
        from harVäder 
        where väderTyp2 = väderTyp0 and harVäder.tävlingsNamn3 = tävling.tävlingsNamn0
	)
); 
#where harVäder.väderTyp2 = all (select väderTyp2 from harVäder where väderTyp0 = väderTyp2);

# Uppgift 9
select harSnö.snöTyp2
from tävling, harSnö
where harSnö.tävlingsNamn2 = tävling.tävlingsNamn0; 

# Uppgift 10
select delta.skidÅNamn2, count(*) as "Deltagna Tävlingar"
from delta
group by delta.skidÅNamn2 having count(*) = 2;

# Uppgift 11
select valla.vallNamn0 
from valla
order by valla.vallNamn0 DESC;

# Uppgift 12
select AVG(skidåkare.skidÅVikt0) as "Medelvikt"
from skidåkare;

# Uppgift 13
select delta.tävlingsNamn1 as "Tävling", AVG(skidåkare.skidÅVikt0) as "Skidåkarnas Medelvikt"
from skidåkare, delta 
where skidåkare.skidÅNamn0 = delta.skidÅNamn2
group by delta.tävlingsNamn1;

# Uppgift 14
select rillverktyg.rillVerkFabrikat0 as "Fabrikat"
from rillverktyg
where rillverktyg.rillVerkFabrikat0 like 's%';

# Uppgift 15
select rillverktyg.kommentar0 as "Fabrikat"
from rillverktyg
where rillverktyg.kommentar0 like '_____';

# Uppgift 16
select väder.väderTyp0 as "Typ", väder.väderTemp0 as "Min. Temperatur"
from väder order by väder.väderTemp0 asc limit 1; 

# Uppgift 17										Var tvungen att lägga till årtal på "Tour de Ski" för att de ska fungera ordentligt. 
select max(tävling.tävlingsDatum0)
from tävling
where tävling.tävlingsNamn0 like "Tour de Ski%";

# Uppgift 18
select tävling.tävlingsNamn0 as "Tävling", tävling.tävlingsDatum0
from tävling
order by tävling.tävlingsDatum0 DESC limit 1;

# Uppgift 19
update skidåkare 
set skidÅVikt0 = (skidÅVikt0*1.1)
where skidÅVikt0 between 50 and 60;

select * from skidåkare;
# Uppgift 20
delete from skidåkare
where skidåkare.skidÅNamn0 = "Anna Haag";				# Det går inte att radera primärnycklar utan att skriva koden på ett speciellt sätt. Man ska inte egentligen ta bort primärnycklar.
select * from skidåkare;
# Uppgift 21
select * from skidor;
delete from skidor
where skidor.skidÅNamn1 = "Markus Hellner" and skidor.skidNr0 = 2;
select * from skidor; 