create database eval;

create table rns(
    id serial primary key not null ,
    name varchar(10),
    begin_km varchar(50),
    end_km varchar(50),
    pk_begin int,
    pk_end int,
    length float
);
drop table rns cascade ;

insert into rns(name, begin_km, end_km, pk_begin, pk_end, length) VALUES ('RN7','Antananarivo-Soarano','Toliara',0,943,943.2);
insert into rns(name, begin_km, end_km, pk_begin, pk_end, length) VALUES ('RN4','Antananarivo-Soarano','Mahajanga',0,540,540.3);
insert into rns(name, begin_km, end_km, pk_begin, pk_end, length) VALUES ('RN2','Antananarivo-Soarano','Tamaga',0,420,420.3);
select * from rns;

create table roads(
      id serial primary key not null ,
      idrns int references rns(id),
      begin_pk double precision,
      end_pk double precision,
      width double precision,
      profondeur double precision
);
drop table roads;
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (1, 10, 50, 5.5, 10);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (1, 100, 150, 5.5, 8);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (1, 300, 365, 5.5, 12);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (2, 25, 50, 6.3, 11);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (2, 82, 120, 6.3, 10);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (3, 300, 365, 5.5, 12);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (3, 25, 50, 6.3, 11);
insert into roads(idrns, begin_pk, end_pk, width, profondeur) VALUES (3, 82, 120, 6.3, 10);

select * from roads join rns r on r.id = roads.idrns;


create table providers(
      id serial primary key not null ,
      name varchar(50) ,
      speed float,
      emp int,
      birthday date,
      penalty float,
      price double precision
);
insert into providers(name, speed, emp, birthday, penalty, price) VALUES ('COLAS',81,50,'07-03-1993',2,30000);
insert into providers(name, speed, emp, birthday, penalty, price) VALUES ('ANONYME',50,20,'07-03-2000',10,20000);
insert into providers(name, speed, emp, birthday, penalty, price) VALUES ('LALANA',60,45,'07-03-1999',4,25000);
insert into providers(name, speed, emp, birthday, penalty, price) VALUES ('NDAO',45,35,'07-03-2010',3,35000);

drop table providers cascade ;
create table formula(
    id serial primary key not null ,
    idNationalRoute serial references rns(id),
    quality text
);
drop table formula;

insert into formula(idNationalRoute, quality) values (1, '((4*speed)+(2*emp)+((1/2)*anc))');
insert into formula(idNationalRoute, quality) values (2, '((4*(speed+emp))+((1/2)*anc)-(4*penalty))');
insert into formula(idNationalRoute, quality) values (3, '(2 * RN7 * RN4 + 2)');

create view form as
select
    p.name as name,
    p.penalty as penalty,
    p.speed as speed,
    p.emp as emp,
    p.price as price,
    date_part('year',age(current_date,birthday)) as anc
from providers p;

create table fusions as
select
    name,
    penalty,
    speed,
    emp,
    price,
    anc,
    ((4*(speed+emp))+((1/2)* anc)-(4*penalty)) as formulas
from form order by formulas desc;

ALTER TABLE fusions
    ADD COLUMN rapport double precision;

drop table fusions;
select * from fusions;


