drop database a22edvbu;
create database a22edvbu;
use a22edvbu;

create table skidåkare(
	skidNamn varchar(20),
    vikt char(3),
    primary key(skidNamn)
)engine=innodb;

create table tävling(
	tävlingsNamn char(50),
    datum varchar(8),
    primary key(tävlingsNamn)
)engine=innodb;
    