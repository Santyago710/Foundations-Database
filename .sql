create database workshop_4;
drop database workshop_4;
create table community(
id_community int auto_increment primary key,
name varchar(25) unique not null,
description varchar(200) );

create table country (
Code_country int auto_increment primary key,
name varchar(25) unique not null
);

create table musical_genre(
id_genre int auto_increment primary key,
name varchar(15) not null,
description varchar (100)
);

create table users (
id_user binary(16) default (UUID_TO_BIN(UUID())),
name varchar(50) not null,
email varchar(30) unique,
phone varchar(50),
nickname varchar(20) unique not null,
password varchar (30) not null,
musical_fk int,
country_fk int,
foreign key (musical_fk) references musical_genre(id_genre),
foreign key (country_fk) references country(code_country)  );	

create index index_user on users(id_user);
create table playlist( 
id_playlist int auto_increment primary key,
name varchar(30) not null,
likes int default 0,
user_fk BINARY(16),
foreign key (user_fk) references users(id_user)); 


create table channel( 
id_channel int auto_increment primary key,
name varchar(30) not null,
description varchar (200),
user_fk BINARY(16),
foreign key (user_fk) references users(id_user));


create table video (
id_video int auto_increment primary key,
name varchar(100) not null,
description varchar (200),
date_upload date  not null,
likes int default 0,
dislikes int default 0,
user_fk binary(16),
genre_fk int,
channel_fk int,
popular_video bool default false,
foreign key (user_fk) references users(id_user),
foreign key (genre_fk) references musical_genre(id_genre),
foreign key (channel_fk) references channel(id_channel));



create table comments(
id_comment int auto_increment primary key,
content varchar(300) not null,
date_creation date not null ,
likes int default 0,
dislikes int default 0 ,
user_fk binary(16),
video_fk int,
foreign key (user_fk) references users(id_user),
foreign key (video_fk) references video(id_video)
);


create table bank_account(
unique_id int auto_increment primary key, 
bank_name varchar(100) not null,
account_number varchar(200) unique not null,
country_fk int,
user_fk binary(16),
foreign key (country_fk) references country(code_country),
foreign key (user_fk) references users(id_user)
);


create table playlist_video_rel (
id_playlist_video int auto_increment primary key,
playlist_fk int,
video_fk int,
foreign key (playlist_fk) references playlist(id_playlist),
foreign key (video_fk) references video(id_video)
);

create table community_user_rel (
id_community_user int auto_increment primary key,
expiration_date date,
community_fk int,
user_fk binary(16),
foreign key (community_fk) references community(id_community),
foreign key (user_fk) references users(id_user)
);

create table subs(
id_subs int auto_increment primary key,
pay bool default false,
pay_cost float not null,
date_subs date  not null, 
user_fk binary(16),
channel_fk int, 
foreign key (user_fk) references users(id_user),
foreign key (channel_fk) references channel(id_channel)
);

insert into community (id_community, name , description) values (1, 'FOOLS', 'Tk off/land-crew aircrft');
insert into community (id_community, name , description) values (2, 'OLA', 'Benign neoplasm breast');
insert into community (id_community, name , description) values (3, 'RULOS', 'Nonspecif skin erupt NEC');
insert into community (id_community, name , description) values (4, 'HOLA2', 'Leprosy NOS');
insert into community (id_community, name , description) values (5, 'HrLA3', 'Ac marginal ulcer w perf');


insert into country  (Code_country , name ) values (1, 'Czech Republic');
insert into country  (Code_country , name ) values (2, 'China');
insert into country  (Code_country , name ) values (3, 'Sri Lanka');
insert into country  (Code_country , name ) values (4, 'Indonesia');
insert into country  (Code_country , name ) values (5, 'Colombia ');

insert into musical_genre (id_genre , name , description ) values (1, 'Damara', 'Occipital encephalocele');
insert into musical_genre (id_genre , name , description ) values (2, 'Yovonnda', 'Rheumatoid polyneuropathy with rheumatoid arthritis of knee');
insert into musical_genre (id_genre , name , description ) values (3, 'Madelyn', 'Open bite, left knee, subsequent encounter');
insert into musical_genre (id_genre , name , description ) values (4, 'Inge', 'Other specified disorders of synovium and tendon');
insert into musical_genre (id_genre , name , description ) values (5, 'Gil', 'Other congenital malformations of renal artery');


INSERT INTO users (name, email, phone, nickname, password, musical_fk, country_fk) 
VALUES 
("Usuario1", 'usuario1@example.com', '123456789', "user1", 'password1', 1, 2),
("Usuario2", 'usuario2@example.com', '987654321', "user2", 'password2', 3, 4),
("Usuario3", 'usuario3@example.com', '555555555', "user3", 'password3', 5, 1),
("Usuario4", 'usuario4@example.com', '444444444', "user4", 'password4', 2, 3),
("Usuario5", 'usuario5@example.com', '111111111', "user5", 'password5', 4, 3),
("Usuario6", 'usuario6@example.com', '999999999', "user6", 'password6', 2, 1),
("Usuario7", 'usuario7@example.com', '888888888', "user7", 'password7', 1, 2),
("Usuario8", 'usuario8@example.com', '777777777', "user8", 'password8', 3, 1),
("Usuario9", 'usuario9@example.com', '666666666', "user9", 'password9', 2, 1),
("Usuario10", 'usuario10@example.com', '333333333', "user10", 'password10', 1, 2);



SELECT BIN_TO_UUID(id_user) AS id_user FROM users;
INSERT INTO playlist (name, likes, user_fk) 
VALUES 
('Playlist1', 10, UUID_TO_BIN('58273720-17c2-11ef-aa91-98eecb517efa')),
('Playlist2', 5, UUID_TO_BIN('5829af2a-17c2-11ef-aa91-98eecb517efa')),
('Playlist3', 8, UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa')),
('Playlist4', 15, UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa')),
('Playlist5', 2, UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa'));

INSERT INTO channel (name, description, user_fk) 
VALUES 
('Canal1', 'Descripción del canal 1', UUID_TO_BIN('58273720-17c2-11ef-aa91-98eecb517efa')),
('Canal2', 'Descripción del canal 2', UUID_TO_BIN('5829af2a-17c2-11ef-aa91-98eecb517efa')),
('Canal3', 'Descripción del canal 3', UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa')),
('Canal4', 'Descripción del canal 4', UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa')),
('Canal5', 'Descripción del canal 5', UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa'));

INSERT INTO video (name, description, date_upload, likes, dislikes, user_fk, genre_fk, channel_fk) 
VALUES 
('Video1', 'Descripción del video 1', '2024-05-21', 10, 5, UUID_TO_BIN('58273720-17c2-11ef-aa91-98eecb517efa'), 1, 1),
('Video2', 'Descripción del video 2', '2024-05-21', 8, 2, UUID_TO_BIN('5829af2a-17c2-11ef-aa91-98eecb517efa'), 2, 2),
('Video3', 'Descripción del video 3', '2024-05-21', 15, 3, UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa'), 3, 3),
('Video4', 'Descripción del video 4', '2024-05-21', 20, 7, UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa'), 4, 4),
('Video5', 'Descripción del video 5', '2024-05-21', 6, 1, UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa'), 5, 5),
('Video6', 'Descripción del video 6', '2024-05-21', 12, 4, UUID_TO_BIN('5829b926-17c2-11ef-aa91-98eecb517efa'), 1, 1),
('Video7', 'Descripción del video 7', '2024-05-21', 18, 6, UUID_TO_BIN('5829ba2d-17c2-11ef-aa91-98eecb517efa'), 2, 2),
('Video8', 'Descripción del video 8', '2024-05-21', 22, 8, UUID_TO_BIN('5829bb2f-17c2-11ef-aa91-98eecb517efa'), 3, 3),
('Video9', 'Descripción del video 9', '2024-05-21', 28, 10, UUID_TO_BIN('5829bd57-17c2-11ef-aa91-98eecb517efa'), 4, 4),
('Video10', 'Descripción del video 10', '2024-05-21', 25, 5, UUID_TO_BIN('5829bf00-17c2-11ef-aa91-98eecb517efa'), 5, 5);


INSERT INTO comments (content, date_creation, user_fk, video_fk) 
VALUES 
('Comentario1', '2024-05-21', UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa'), 1),
('Comentario2', '2024-05-21', UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa'), 2),
('Comentario3', '2024-05-21', UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa'), 3),
('Comentario4', '2024-05-21', UUID_TO_BIN('5829b926-17c2-11ef-aa91-98eecb517efa'), 4),
('Comentario5', '2024-05-21', UUID_TO_BIN('5829ba2d-17c2-11ef-aa91-98eecb517efa'), 5);

INSERT INTO bank_account (bank_name, account_number, country_fk, user_fk) 
VALUES 
('Bank1', '123456789', 1, UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa')),
('Bank2', '987654321', 2, UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa')),
('Bank3', '555555555', 3, UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa')),
('Bank4', '444444444', 4, UUID_TO_BIN('5829b926-17c2-11ef-aa91-98eecb517efa')),
('Bank5', '111111111', 5, UUID_TO_BIN('5829ba2d-17c2-11ef-aa91-98eecb517efa'));

INSERT INTO playlist_video_rel (playlist_fk, video_fk) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO community_user_rel (expiration_date, community_fk, user_fk) 
VALUES 
('2024-05-21', 1, UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa')),
('2024-05-21', 2, UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa')),
('2024-05-21', 3, UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa')),
('2024-05-21', 4, UUID_TO_BIN('5829b926-17c2-11ef-aa91-98eecb517efa')),
('2024-05-21', 5, UUID_TO_BIN('5829ba2d-17c2-11ef-aa91-98eecb517efa'));

INSERT INTO subs (pay, pay_cost, date_subs, user_fk, channel_fk) 
VALUES 
(false, 0.0, '2024-05-21', UUID_TO_BIN('5829b1a8-17c2-11ef-aa91-98eecb517efa'), 1),
(false, 0.0, '2024-05-21', UUID_TO_BIN('5829b45c-17c2-11ef-aa91-98eecb517efa'), 2),
(false, 0.0, '2024-05-21', UUID_TO_BIN('5829b76c-17c2-11ef-aa91-98eecb517efa'), 3),
(false, 0.0, '2024-05-21', UUID_TO_BIN('5829b926-17c2-11ef-aa91-98eecb517efa'), 4),
(false, 0.0, '2024-05-21', UUID_TO_BIN('5829ba2d-17c2-11ef-aa91-98eecb517efa'), 5);



/*1. All the videos uploaded for any user from an specific country.
2. Show the available music genre and count how many videos there are per genre.
3. Show the information of all videos, adding the name and email of the user who uploaded it, with more than 20 likes.
4. Show all channels that have at leats one subscriber from a specific country.
5. Show all the comments with the related user and video information, where the comment has the word: ugly.
6. Show the first three users with all the related information for country, bank account,
and prefered musical genre, order by email */

SELECT *
FROM video 
JOIN users  ON video.user_fk = users.id_user
JOIN country  ON users.country_fk = country.Code_country
WHERE country.name = 'china';

SELECT musical_genre.name, COUNT(video.id_video) AS video_count
FROM musical_genre 
LEFT JOIN video  ON musical_genre.id_genre = video.genre_fk
GROUP BY musical_genre.name;


SELECT *, users.name AS nombre_user, users.email AS user_email
FROM video 
JOIN users  ON video.user_fk = users.id_user
WHERE video.likes > 20;


SELECT DISTINCT *
FROM channel 
JOIN subs  ON channel.id_channel = subs.channel_fk
JOIN users  ON subs.user_fk = users.id_user
JOIN country  ON users.country_fk = country.code_country
WHERE country.name = 'china';