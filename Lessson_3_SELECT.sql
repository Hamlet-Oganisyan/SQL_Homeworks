---SELECT--

--1) �������� � ��� ������ ��������, �������� � 2018 ����
select album_name, year_release 
from albums a 
where year_release ='2018-01-01'

--2) �������� � ����������������� ������ ����������� �����
select treck_name, treck_duration
from trecks t 
order by treck_duration desc limit 1

--3) �������� ������, ����������������� ������� �� ����� 3,5 ������
select treck_name, treck_duration
from trecks t
where treck_duration >= 3.30

--4) �������� ���������, �������� � ������ � 2018 �� 2020 ��� ������������
select collection_name 
from collections c 
where year_release between '2018-01-01' and '2020-12-31'

--5) �����������, ��� ��� ������� �� 1 �����
select singer_name
from singers s 
where singer_name not like '%% %%'

--6) �������� ������, ������� �������� ����� "���"/"my
select treck_name
from trecks t 
where treck_name ilike '%%my%%' or treck_name ilike '%%���%%'