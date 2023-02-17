drop database a22edvbu;
create database a22edvbu;
use a22edvbu;

create table skidåkare(
	skidÅNamn varchar(20),
    skidÅVikt varChar(3),
    primary key(skidÅNamn)
)engine=InnoDB;

create table tävling(
	tävlingsNamn varChar(50),
    tävlingsDatum char(8),
    primary key(tävlingsNamn)
)engine=InnoDB;

create table snö(
	snöTyp varChar(12),
    snöLuftF varChar(3),
    primary key(snöTyp)
)engine=InnoDB;

create table väder(
	väderTyp varChar(12),
    väderTemp char(3),
    primary key(väderTyp)
)engine=InnoDB; 

create table struktur(
	struktNamn varChar (20),
    struktGrovlek varChar (20),
    primary key(struktNamn)
)engine=innodb;

create table valla(
	vallNamn varChar(15),
    vallTyp char(1),
    primary key(vallNamn)
)engine=InnoDB;

create table skidor(
	skidNr char(8),
    skidFabrikat varChar(30),
    skidSpann varChar(4),
    skidÅNamn varchar(20),
    snöTyp varChar(12),
    väderTyp varChar(12),
    struktNamn varChar(20),
    primary key (skidNr, skidÅNamn),
    foreign key (skidÅNamn) references skidåkare(skidÅNamn),
    foreign key (snöTyp) references snö(snöTyp),
    foreign key (väderTyp) references väder(väderTyp),
    foreign key (struktNamn) references struktur(struktNamn)
)engine=InnoDB;

create table rillverktyg(
	rillVerkFabrikat varChar(30),
    kommentar varChar(300),
    struktNamn varChar(20),
    primary key (rillVerkFabrikat, struktNamn),
    foreign key (struktNamn) references struktur(struktNamn)
)engine=InnoDB;

create table delta(
	skidÅNamn varChar(20),
    tävlingsNamn varChar(50),
    primary key (skidÅNamn, tävlingsNamn),
    foreign key (skidÅNamn) references skidåkare(skidÅNamn),
    foreign key (tävlingsNamn) references tävling(tävlingsNamn)
)engine=InnoDB;

create table harVäder(
	tävlingsNamn varChar(50),
    väderTyp varChar(12),
    harTid char(4),
    primary key (tävlingsNamn, väderTyp),
    foreign key (tävlingsNamn) references tävling(tävlingsNamn),
    foreign key (väderTyp) references väder(väderTyp)
)engine=InnoDB;

create table harSnö(
	tävlingsNamn varChar(50),
    snöTyp varChar(12),
    primary key (tävlingsNamn, snöTyp),
    foreign key (tävlingsNamn) references tävling(tävlingsNamn),
    foreign key (snöTyp) references snö(snöTyp)
)engine=InnoDB;

create table vallad(
	skidÅNamn varChar(20),
    skidNr char(8),
	vallNamn varChar(15),
    primary key (skidÅNamn, skidNr, vallNamn),
    foreign key (skidNr) references skidor(skidNr),
    foreign	key	(skidÅNamn) references skidåkare(skidÅNamn),
    foreign key (vallNamn) references valla(vallNamn)
)engine=InnoDB;

insert into skidåkare(skidÅNamn, skidÅVikt) values ('Therese Johaug', '46');
insert into skidåkare(skidÅNamn, skidÅVikt) values ('Lars-Åke Bly', '76');
insert into skidåkare(skidÅNamn, skidÅVikt) values ('Erik Bly', '67');
insert into skidåkare(skidÅNamn, skidÅvikt) values ('Charlotte Kalla', '78');

insert into tävling(tävlingsNamn, tävlingsDatum) values ('Mördarbacken', '10012016');
insert into tävling(tävlingsNamn, tävlingsDatum) values ('Oberstdorf', '05012016');

insert into harSnö(tävlingsNamn, snöTyp) values ('Oberstdorf', 'Slask');

insert into harVäder(tävlingsNamn, väderType, harTid) values ('Oberstdorf', 'Extremt kallt', '0800');

insert into väder(väderTyp, väderTemp) values ('Extremt kallt', '-20');

insert into snö(snöTyp, snöLuftF) values ('Slask', '100')