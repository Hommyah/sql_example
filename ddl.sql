create table Cities
(
    id         int primary key,
    name       text,
    population int,
    founded    date,
    country_id int,
    foreign key (country_id) references Countries (id)
);



drop table Cities;

create table Countries
(
    id         int primary key,
    name       text,
    population int,
    gdp        int
);

create table Companies
(
    id      int primary key,
    name    text,
    city_id int,
    revenue int,
    labors  int,
    foreign key (city_id) references Cities (id)
);

drop table BigCompanies;
select * from BigCompanies;

create table BigCompanies
(
    country_id        int,
    big_companies_cnt int,
    foreign key (country_id) references Countries (id)
);

insert into BigCompanies select Countries.id as country_id, count(*) as big_companies_cnt
from Countries
         join Cities on Countries.id = Cities.country_id
         join Companies on Cities.id = Companies.city_id and Companies.labors > 1000
group by Countries.id;

