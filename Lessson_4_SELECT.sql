--SELECT--
select * from trecks t 


--1) ���������� ������������ � ������
select genre_name, count(singer_name)
from genre g
join genre_singers gs  on g.genre_id = gs.genre_id 
join singers s on s.singer_id = gs.singer_id 
group by genre_name 
order by genre_name 

--2) ���������� ������, �������� � ������� 2019-2020 �����
select a.album_name, a.year_release, count(t.treck_name)  as trecks_count
from albums a
join albums_trecks at2 on at2.album_id = a.album_id 
join trecks t on t.treck_id = at2.treck_id 
group by a.album_name, a.year_release
having year_release between '2019-01-01' and '2020-12-31'

--3) ������� ����������������� ������ �� ������� �������
select a.album_name, avg(t.treck_duration) as trecks_avg_duration
from albums a 
join albums_trecks at2 on a.album_id = at2.album_id 
join trecks t on t.treck_id = at2.treck_id
group by a.album_name
order by a.album_name

--4) ��� �����������, ������� �� ��������� ������� � 2020 ����
select singer_name, a.year_release 
from singers s 
join singers_albums sa on s.singer_id = sa.singer_id 
join albums a on a.album_id  = sa.album_id
where year_release != '2020-01-01'

--5) �������� ���������, � ������� ������������ ���������� �����������
select collection_name, s.singer_name
from collections c 
join trecks_collections tc on c.collection_id = tc.collection_id 
join trecks_singers ts on ts.treck_id = tc.treck_id 
join singers s on s.singer_id = ts.singer_id 
where s.singer_name = 'Charles Aznavour'

--7) ������������ ������, ������� �� ������ � ��������
select treck_name
from trecks t 
left join trecks_collections tc on t.treck_id = tc.treck_id 
left join collections c on c.collection_id = tc.collection_id 
where c.collection_id is null 

--8) �����������(-��), ����������� ����� �������� �� ����������������� ����
select s.singer_name, t.treck_name , t.treck_duration 
from singers s 
join trecks_singers ts on s.singer_id = ts.singer_id
join trecks t on t.treck_id = ts.treck_id 
where t.treck_duration = (select min(treck_duration) from trecks t )

--9) �������� ��������, ���������� ���������� ���������� ������(� ����� ������� ������ 3-�)
select a.album_name, count(t.treck_name) as trecks_count 
from albums a 
join albums_trecks at2 on a.album_id = at2.album_id 
join trecks t on t.treck_id = at2.treck_id 
group by a.album_name
having count(t.treck_name) < 3



