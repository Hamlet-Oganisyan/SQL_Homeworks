--INSERT--

-- �.�. � ���������� ����� insert-�������� �� ���� �������� 2019-2020 ��, 
-- � ����� ������ � ���, �� �������� � ������� � �����
INSERT INTO
   Albums(album_name, year_release)
VALUES
   ('Holy Water', '2020-01-01'),
   ('Without Words: Genesis', '2019-01-01'),
   ('Still', '2019-01-01')
   
INSERT INTO
   Trecks(treck_name, treck_duration)
VALUES
   ('Waking Up', 5.17),
   ('Cages', 3.35),
   ('SOS', 4.39),
   ('No Longer Slaves', 5.02),
   ('Tremble', 3.21),
   ('Living Hope', 4.22),
   ('Godness of God', 4.29),
   ('Above all', 4.36),
   ('Awesome God', 3.17) 

-- �������� ����� ��������� ������� ������ ����� ������������� � ������� Trecks_Singers
INSERT INTO
   Trecks_Singers(treck_id, singer_id)
values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 4),
	(6, 5),
	(7, 5),
	(8, 5),
	(9, 8),
	(10, 8),
	(11, 8),
	(12, 8),
	(13, 9),
	(14, 9),
	(15, 9),
	(16, 7),
	(17, 6),
	(18, 6),
	(19, 6),
	(20, 2),
	(21, 10),
	(22, 10),
	(23, 10),
	(24, 9),
	(25, 9),
	(26, 9),
	(27, 9),
	(28, 9),
	(29, 9),
	(30, 9),
	(31, 8),
	(32, 8)
	

-- �������� ����� ��������� ������� ������ ����� ��������� � ������� Albums_Trecks
INSERT INTO
   Albums_Trecks(album_id, treck_id)
values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 6),
	(6, 10),
	(7, 11),
	(8, 12),
	(9, 20),
	(10, 22),
	(11, 23),
	(12, 24),
	(12, 25),
	(12, 26),
	(13, 27),
	(13, 28),
	(13, 29),
	(13, 30),
	(14, 31),
	(14, 32)
	

------ ���������� insert-������� -------

-- ������ ������������ � ������� genre
INSERT INTO
   Genre(genre_name)
values
   ('Pop'),
   ('Rock'),
   ('Rap'),
   ('Classic'), 
   ('Chanson'),
   ('Jazz'),
   ('Disco'),
   ('Gospel')

-- ������ ������������ � ������� Singers
INSERT INTO
   singers(singer_name)
VALUES
   ('Bon Jovi'),
   ('Dr. Alban'),
   ('Eminem'),
   ('MC Hummer'),
   ('Charles Aznavour'),
   ('Boney M.'),
   ('Louis Armstrong'),
   ('Michael W. Smith'),
   ('Bethel Music'),
   ('TobyMac')
   
   
-- ������ �������� ����� � ������� Albums
INSERT INTO
   Albums(album_name, year_release)
VALUES
   ('Crush', '2000-01-01'),
   ('One Love', '1992-01-01'),
   ('Curtain Call: The Hits', '2005-01-01'),
   ('Please Hammer, Don�t Hurt', '1990-01-01'),
   ('Autobiographie', '1980-01-01'),
   ('Worship Forever Live', '2021-01-01'),
   ('Surrounded', '2018-01-01'),
   ('Blackout', '2018-01-01'),
   ('Hello Afrika', '1991-01-01'),
   ('The Elements', '2018-01-01'),
   ('Tonight', '2010-01-01')
   
-- ������ �������� ����� � ������� Trecks
INSERT INTO
   Trecks(treck_name, treck_duration)
VALUES
   ('It�s My Life(Bon Jovi)', 3.44),
   ('It�s My Life(Dr. Alban)', 4.34),
   ('Lose yourself', 5.21),
   ('U Cant Touch This', 4.22),
   ('Sweet Reggae Music', 5.27),
   ('Une vie damour', 3.26),
   ('Mon Ami Mon Judas', 3.36),
   ('Emmenez-moi', 3.36),
   ('Forever Live', 6.35),
   ('Awesome God', 5.19 ),
   ('King of My Heart', 4.21),
   ('Great Are You Lord', 4.38),
   ('Christ Is Risen Live', 4.37),
   ('Victory Is Yours Live', 5.33),
   ('Be Lifted High', 6.56),
   ('God I Look To You', 7.34),
   ('Bye and Bye', 2.32),
   ('Daddy Cool', 3.28),
   ('Sunny', 3.58),
   ('No Coke (Redux)', 3.40),
   ('Made To Love', 3.50),
   ('I just need U.', 3.44),
   ('Horizon (A New Day)', 3.13)
   
   
   
   
-- ������ �������� ��������� � ������� Collections
INSERT INTO
   Collections(collection_name, year_release)
VALUES
   ('Tokyo Road Live', '2020-01-01'),
   ('Best of Dr. Alban', '2013-01-01'),
   ('Music To Be  Murdered By - Side B', '2020-01-01'),
   ('U Cant Touch This: The Collection', '2003-01-01'),
   ('Ses plus belles chansons', '2018-01-01'),
   ('Worship Forever Live', '2021-01-01'),
   ('Victory', '2019-01-01'),
   ('Be Lifted High Live', '2011-01-01'),
   ('Gospel Book', '2021-01-01'),
   ('The Magic Of Boney M Special Rmx Edition', '2022-01-01'),
   ('Its My Life Redux', '2020-01-01'),
   ('TobyMac Collection', '2020-01-01')
   
   
   

-- ������ ������ � ������� ������ genre_singers
INSERT INTO
   genre_singers(genre_id, singer_id)
values
	(2, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(5, 5),
	(7, 6),
	(6, 7),
	(8, 8),
	(8, 9),
	(8, 10)
	
-- ������ ������ � ������� ������ singers_albums
INSERT INTO
   singers_albums(singer_id, album_id)
values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(6, 5),
	(8, 6),
	(6, 7),
	(8, 8),
	(2, 9),
	(10, 10),
	(10, 11)

-- ������ ������ � ������� ������ singers_albums
INSERT INTO
   trecks_collections(treck_id, collection_id)
values
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(6, 5),
	(9, 6),
	(10, 7),
	(15, 8),
	(16, 9),
	(18, 10),
	(20, 11),
	(21, 12)
	
	

	