create database baseball_databank;

use baseball_databank;

drop table if exists master;

create table master(
	player_id     varchar(10) not null primary key,
	birth_year    int(4)   default 1999,	
	birth_month   int(2)   default 5,	
	birth_day     int(2)   default 20,	
	birth_country char(50) default 'USA',	
	birth_state   char(50) default 'LA',	
	name_first    char(50) default 'UNKNOWN',	
	name_last     char(50) default 'UNKNOWN',	
	name_given    char(50) default 'UNKNOWN',	
	weight        int(3)   default 200,	
	height        int(2)   default 75,	
	debut         date     default '2000-01-01'
);

insert into master(player_id, birth_year, birth_month, birth_day, birth_country, birth_state, name_first, name_last, name_given, weight, height, debut) values 
('aardsda01', 1981, 12, 27, 'USA', 'CO', 'David', 'Aardsma', 'David Allan', 220, 75, '2004-04-06'),
('aaronha01', 1934, 2, 5, 'USA', 'AL', 'Hank', 'Aaron', 'Henry Louis', 180, 72, '1954-04-13'),
('aaronto01', 1939, 8, 5, 'USA', 'AL', 'Tommie', 'Aaron', 'Tommie Lee', 190, 75, '1962-04-10'),
('aasedo01',  1954, 9, 8, 'USA', 'CA', 'Don', 'Aase', 'Donald William', 190, 75, '1977-07-26'),
('abadan01', 1972, 8, 25, 'USA', 'FL', 'Andy', 'Abad', 'Fausto Andres', 184, 73, '2001-09-10'),
('abadfe01', 1985, 12, 17, 'D.R.', 'La Romana', 'Fernando', 'Abad', 'Fernando Antonio', 220, 73, '2010-07-28');

select * from master;

drop table if exists batting;

create table batting(
player_id varchar(10) not null, 	
year_id	  int(4)      not null,
stint_id  int(1)      not null,
team_id	  varchar(3)  not null,
games	  int(3) default 100,
at_bats	  int(3) default 100,
runs	  int(3) default 50,
hits	  int(3) default 50,
doubles	  int(3) default 20,
triples	  int(3) default 20,
homeruns  int(3) default 20,
strikeouts int(3) default 20,
player_idf varchar(10) not null,
foreign key (player_idf) references master (player_id),
primary key (player_id, year_id, stint_id, team_id )
);

insert into batting(player_id, year_id, stint_id, team_id,games, at_bats, runs, hits, doubles, triples, homeruns, strikeouts, player_idf) values 
('aaronha01', 1954, 1, 'ML1', 122, 468, 58, 131, 27, 6, 13, 39, 'aaronha01'),
('aaronto01', 1962, 1, 'ML1', 141, 334, 54, 77, 20, 2, 8, 58, 'aaronto01'),
('aasedo01',  1977, 1, 'BOS', 13, 0, 0, 0, 0, 0, 0, 0, 'aasedo01'),
('abadan01',  2001, 1, 'OAK', 1, 1, 0, 0, 0, 0, 0, 0, 'abadan01'),
('aardsda01', 2004, 1, 'SFN', 11, 0, 0, 0, 0, 0, 0, 0, 'aardsda01'),
('abadfe01',  2010, 1, 'HOU', 22, 1, 0, 0, 0, 0, 0, 1, 'abadfe01');

select * from batting;

drop table if exists fielding;

create table fielding(
player_id    varchar(10) not null,	
year_id	     int(4)      not null,
stint_id	 int(1)      not null,
team_id	     varchar(3)  not null,
pos_id	     varchar(3)  not null,
games 	     int(4) default 100,
time_played	 int(4) default 500,
putouts	     int(4) default 100,
assists	     int(4) default 20,
errors	     int(4) default 20,
double_plays int(4) default 20,
player_idf   varchar(10) not null,
foreign key (player_idf) references master (player_id),
primary key (player_id, year_id, stint_id, team_id, pos_id )
);

insert into fielding (player_id, year_id, stint_id, team_id, pos_id, games, time_played, putouts, assists, errors, double_plays, player_idf) values
('aaronha01', 1954, 1, 'ML1', 'LF', 105, 2773, 205, 4, 6, 0, 'aaronha01'),
('aaronto01', 1962, 1, 'ML1', '1B', 110, 1507, 507, 45, 6, 55, 'aaronto01'),
('aasedo01',  1977, 1, 'BOS', 'P', 13, 277, 5, 13, 1, 0, 'aasedo01'),
('abadan01',  2001, 1, 'OAK', '1B', 1, 3, 2, 0, 0, 1, 'abadan01'),
('aardsda01', 2004, 1, 'SFN', 'P', 11, 33, 0, 0, 0, 0, 'aardsda01'),
('abadfe01',  2010, 1, 'HOU', 'P', 22, 57, 0, 3, 0, 0, 'abadfe01');

select * from fielding;

drop table if exists pitching;

create table pitching(
player_id       varchar(10) not null,	
year_id	        int(4)      not null,
stint_id        int(1)      not null,
team_id	        varchar(3)  not null,
wins	        int(4) default 5,
losses	        int(4) default 5,
games	        int(4) default 10,
complete_games 	int(4) default 5,
shutouts        int(4) default 5,
outs_pitched    int(4) default 50,
hits	        int(4) default 50,
homeruns        int(4) default 50,
strikeouts      int(4) default 50,
player_idf      varchar(10) not null,
foreign key (player_idf) references master (player_id),
primary key (player_id, year_id, stint_id, team_id)
);

insert into pitching (player_id, year_id, stint_id, team_id, wins, losses, games, complete_games, shutouts, outs_pitched, hits, homeruns, strikeouts , player_idf) values
('aasedo01',  1977, 1, 'BOS', 6, 2, 13, 4, 2, 277, 85, 6, 49, 'aasedo01'),
('aardsda01', 2004, 1, 'SFN', 1, 0, 11, 0, 0, 32, 20, 1, 5, 'aardsda01'),
('abadfe01',  2010, 1, 'HOU', 0, 1, 22, 0, 0, 57, 14, 3, 12, 'abadfe01');

select * from pitching;

drop table if exists salaries;

create table salaries(
year_id    int(4)      not null,
team_id    varchar(3)  not null,
player_id  varchar(10) not null,
salary     int(10) default 500000,
player_idf varchar(10) not null,
foreign key (player_idf) references master (player_id),
primary key (player_id, year_id, team_id)
);

insert into salaries(year_id, team_id, player_id, salary, player_idf ) values
(1986, 'BAL', 'aasedo01', 600000, 'aasedo01'),
(1987, 'BAL', 'aasedo01', 625000, 'aasedo01'),
(1988, 'BAL', 'aasedo01', 675000, 'aasedo01'),
(1989, 'NYN', 'aasedo01', 400000, 'aasedo01'),
(2004, 'SFN', 'aardsda01', 300000, 'aardsda01'),
(2006, 'CIN', 'abadan01', 327000, 'abadan01'),
(2007, 'CHA', 'aardsda01', 387500, 'aardsda01'),
(2008, 'BOS', 'aardsda01', 403250, 'aardsda01'),
(2009, 'SEA', 'aardsda01', 419000, 'aardsda01'),
(2010, 'SEA', 'aardsda01', 2750000, 'aardsda01'),
(2011, 'HOU', 'abadfe01', 418000, 'abadfe01'),
(2011, 'SEA', 'aardsda01', 4500000, 'aardsda01'),
(2012, 'HOU', 'abadfe01', 485000, 'abadfe01'),
(2012, 'NYA', 'aardsda01', 500000, 'aardsda01'),
(2014, 'OAK', 'abadfe01', 525900, 'abadfe01'),
(2015, 'OAK', 'abadfe01', 1087500, 'abadfe01');

select * from salaries;







