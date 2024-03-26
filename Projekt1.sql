--Tabele ZAWODNICY,KLUBY,SPOTKANIA,SELEKCJONER,STADION
create table Zawodnicy
(
id_zawodnika NUMBER(3) constraint Zawodnic_PK primary key,
nazwisko varchar2(30) constraint Zawodnicy_nazw check(nazwisko is not null),
imie varchar2(20) constraint Zawodnicy_imie check(imie is not null),
data_urodzenia date,
id_klubu varchar2(30) default 'brak klubu',
poczatek_kontraktu date,
zakonczenie_kontraktu date,
rodzaj_kontraktu varchar2(30) constraint Zawodnicy_kontr check(rodzaj_kontraktu in('Wykupiony','Na wypo퓓czeniu')),
placa number(4) default 0
);

create table Selekcjonerzy
(
id_selekcjonera number(3) constraint Selekcjonerzy_PK primary key,
nazwisko varchar2(30) constraint Selekcjonerzy_nazw check(nazwisko is not null),
imie varchar2(20) constraint Selekcjonerzy_imie check(imie is not null),
data_urodzenia date,
poczatek_kontraktu date,
zakonczenie_kontraktu date,
placa number(4) default 0
);

create table Kluby
(
id_klubu number(3) constraint Kluby_PK primary key,
nazwa_klubu varchar2(50) constraint Kluby_nazwa check(nazwa_klubu is not null),
id_selekcjonera number(3),
artosc_klubu number(3) default 0,
rok_zalozenia number(4),
stadion_klubu varchar2(50) default 'brak stadionu',
constraint kluby_selekcjoner_fk foreign key (id_selekcjonera) references Selekcjonerzy(id_selekcjonera)
on delete set null
);

create table Spotkania
(
id_meczu number(3) constraint Mecze_PK primary key,
data_meczu date,
id_klubu1 number(2) constraint Spotnania_kluby1 check(id_klubu1 is not null),
id_klubu2 number(2) constraint Spotnania_kluby2 check(id_klubu2 is not null),
stadion varchar2(50) constraint Spotnania_stadion check(stadion is not null),
liczba_bramek1 number(2) default 0,
liczba_bramek2 number(2) default 0,
constraint Spotkania_klub1_fk foreign key(id_klubu1)references Kluby(id_klubu)on delete cascade,
constraint Spotkania_klub2_fk foreign key(id_klubu2)references Kluby(id_klubu)on delete cascade
);

create table Stadiony
(
stadion varchar2(30) constraint Stadiony_stadion check(stadion is not null),
bilet_normalny number(3),
bilet_ulgowy number(3)
);

--ZAWODNICY ZROBIENI@@@@@@@@@@@@@@@(Zawodnicy zostali uszczupleni ze wzgledu na rosnaca inflacje, dlatego jest ich tak malo oraz tak malo im placa.
--Nie wszyscy chcieli znalez sie w tym zestawieniu)
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(1,'Big','Janus','2002.02.08',1,'2018.03.19','2024.03.20','Wykupiony',7000);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(2,'Big','Michas','2001.02.24',2,'2017.03.23','2025.03.23','Na wypo퓓czeniu',2137);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(3,'Big','Pikas','2000.02.14',3,'2016.01.31','2024.01.31','Wykupiony',9911);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(4,'Big','Jikas','1999.02.12',4,'2015.07.21','2026.07.21','Wykupiony',6454);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(5,'Big','Dikas','1998.02.14',5,'2014.06.21','2028.06.21','Na wypo퓓czeniu',1347);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(6,'Big','Riczas','1999.02.16',6,'2014.05.06','2023.05.06','Wykupiony',7648);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(7,'Big','Jukas','1998.02.18',7,'2013.04.03','2025.04.03','Wykupiony',7864);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(8,'Big','Lukas','1997.02.03',8,'2012.11.01','2027.11.01','Wykupiony',8946);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(9,'Big','Dakus','1996.02.02',9,'2011.03.08','2030.03.08','Na wypo퓓czeniu',4513);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(10,'Big','Pakus','1995.02.24',10,'2010.02.07','2032.02.07','Wykupiony',3145);
insert into Zawodnicy (id_zawodnika,nazwisko,imie,data_urodzenia,id_klubu,poczatek_kontraktu,zakonczenie_kontraktu,rodzaj_kontraktu,placa) 
values(11,'Big','Krakus','1994.01.18',1,'2009.03.30','2034.03.30','Wykupiony',7845);
--SELEKCJONERZY ZROBIENI@@@@@@@@@@@@@@@@@
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(1,'Charhut','Michal','2000.03.01','2020.03.19','2027.03.20',8000);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(2,'Anus','Janus','1990.03.01','2010.03.19','2024.03.20',2000);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(3,'Human','Stanislaw','1992.09.21','2018.03.01','2054.03.01',2897);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(4,'Malik','Damian','1983.11.03','2017.09.11','2026.09.11',7897);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(5,'Huba','Pawel','1975.12.07','2016.04.12','2030.04.12',4564);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(6,'Gerni','Nracz','1964.10.09','2015.03.25','2028.03.25',6969);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(7,'Durin','Rhorim','1989.04.11','2014.12.23','2028.12.23',9911);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(8,'Utszebe','James','1978.02.21','2013.11.18','2028.11.18',2137);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(9,'Nasus','Susan','1948.03.24','1968.02.04','2027.02.04',5400);
insert into Selekcjonerzy (id_selekcjonera,nazwisko,imie,data_urodzenia,poczatek_kontraktu,zakonczenie_kontraktu,placa) 
values(10,'Suna','Darek','1920.01.06','2011.01.05','2024.01.05',9000);
--KLUBY ZROBIONE@@@@@@@@@@@@@@@@@@@@@@
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (1,'Burry the light',1,40,'1960','Indanger Warszawa');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (2,'Devil Trigger',2,30,'1969','Subhuman Wroclaw');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (3,'Subhuman',3,21,'1971','Devil Poznan');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (4,'Terrible Kot',4,37,'1920','Karkow Arena');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (5,'Kiedys mialem druzyne',5,69,'1990','United Gdansk');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (6,'Karly Goro',6,9,'1987','Orleta Zabrze');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (7,'Giganci Industrice',7,7,'1967','Inductor Polanka');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (8,'Bialy Orzel',8,9,'1965','Gownan Osiek');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (9,'Organizacja Penolis',9,11,'1940','Penolis Glebowice');
insert into Kluby (id_klubu,nazwa_klubu,id_selekcjonera,artosc_klubu,rok_zalozenia,stadion_klubu)
values (10,'Burry the Inkub',10,98,'1920','Burry the Lisieniec');
--SPOTKANIA SKONCZONE@@@@@@@@@@@@@@@@@@
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (1,'2023.02.01',1,2,'Indanger Warszawa',20,1);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (2,'2023.02.02',3,4,'Devil Poznan',4,1);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (3,'2023.02.03',5,6,'United Gdansk',0,2);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (4,'2023.02.04',7,8,'Inductor Polanka',6,5);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (5,'2023.02.05',9,10,'Subhuman Wroclaw',2,2);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (6,'2023.02.06',1,3,'Penolis Glebowice',2,5);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (7,'2023.02.07',2,4,'Karkow Arena',3,4);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (8,'2023.02.08',3,6,'Orleta Zabrze',21,37);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (9,'2023.02.09',4,8,'Gownan Osiek',11,9);
insert into Spotkania (id_meczu,data_meczu,id_klubu1,id_klubu2,stadion,liczba_bramek1,liczba_bramek2)
values (10,'2023.02.10',5,10,'Burry the Lisieniec',8,5);
--STADIONY WYKONANE@@@@@@@@@@@@@@@@@@
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Indanger Warszawa',20,11);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Subhuman Wroclaw',19,10);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Devil Poznan',11,9);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Karkow Arena',15,8);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('United Gdansk',12,7);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Orleta Zabrze',18,9);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Inductor Polanka',16,6);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Gownan Osiek',17,12);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Penolis Glebowice',15,4);
insert into Stadiony (stadion,bilet_normalny,bilet_ulgowy) values('Burry the Lisieniec',14,7);
--Grupowanie
select id_klubu, rok_zalozenia, nazwa_klubu from kluby
group by id_klubu, rok_zalozenia, nazwa_klubu order by rok_zalozenia;
--Having
select data_meczu, abs(sum(liczba_bramek1-liczba_bramek2)) as roznica_bramek 
from Spotkania group by data_meczu having abs(sum(liczba_bramek1-liczba_bramek2))>=3;
--Zlaczenie
select nazwa_klubu ,min(data_urodzenia) najmlodszy_zawodnik, max(data_urodzenia) najstarszy_zawodnik 
from Kluby join zawodnicy using(id_klubu) group by nazwa_klubu order by nazwa_klubu;
--Podzapytanie
select z.nazwisko, z.imie, z.placa from Zawodnicy z where(select max(placa) p from Selekcjonerzy)>z.placa;
--Zapytanie5
select abs(min(artosc_klubu)-max(artosc_klubu))DMC from Kluby;
--Perspektywa1
create view Klasyfikacja as
select wygrana, count(*) wygrane_mecze from (select case 
when liczba_bramek1>liczba_bramek2 then 'Wygrala druzyna '||id_klubu1
when liczba_bramek2>liczba_bramek1 then 'Wygrala druzyna '||id_klubu2
end wygrana from Spotkania)
where wygrana is not null group by wygrana order by count(*)desc;
--Perspektywa2
create view Najstarszy as
select * from Spotkania where id_klubu1=
(select id_klubu from kluby where rok_zalozenia=(select max(rok_zalozenia)from kluby))
or id_klubu2=
(select id_klubu from kluby where rok_zalozenia=(select max(rok_zalozenia)from kluby));
--Perspektywa3
create view Kontrakty_Selekcjonerow as
select * from selekcjonerzy where(id_selekcjonera,zakonczenie_kontraktu-poczatek_kontraktu) 
in(select id_selekcjonera, max(zakonczenie_kontraktu-poczatek_kontraktu) 
from Selekcjonerzy group by id_selekcjonera) order by id_selekcjonera;
--Wywolania perspektyw
select * from Klasyfikacja;
select * from Najstarszy;
select * from Kontrakty_Selekcjonerow;
--Komendy usuwajace
drop view Klasyfikacja;
drop view Najstarszy;
drop view Kontrakty_Selekcjonerow;
drop table Zawodnicy cascade constraints;
drop table Selekcjonerzy cascade constraints;
drop table Kluby cascade constraints;
drop table Spotkania cascade constraints;
drop table Stadiony cascade constraints;
