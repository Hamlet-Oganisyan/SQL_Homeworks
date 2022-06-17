---SELECT--

--1) название и год выхода альбомов, вышедших в 2018 году
select album_name, year_release 
from albums a 
where year_release ='2018-01-01'

--2) название и продолжительность самого длительного трека
select treck_name, treck_duration
from trecks t 
order by treck_duration desc limit 1

--3) название треков, продолжительность которых не менее 3,5 минуты
select treck_name, treck_duration
from trecks t
where treck_duration >= 3.30

--4) названия сборников, вышедших в период с 2018 по 2020 год включительно
select collection_name 
from collections c 
where year_release between '2018-01-01' and '2020-12-31'

--5) исполнители, чье имя состоит из 1 слова
select singer_name
from singers s 
where singer_name not like '%% %%'

--6) название треков, которые содержат слово "мой"/"my
select treck_name
from trecks t 
where treck_name ilike '%%my%%' or treck_name ilike '%%мой%%'