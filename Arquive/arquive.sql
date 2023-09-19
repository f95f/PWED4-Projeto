drop database if exists arquive;
create database arquive;

use arquive;

drop table if exists autor;
create table autor(
	id int not null auto_increment primary key,
    olid varchar(15),
    nome varchar(90) not null,
    sobrenome varchar(180),
    biografia text(300),
    foto varchar(90) default '/img/autores/sem-foto.png'
);

INSERT INTO autor (nome, sobrenome, biografia, foto, olid) VALUES
('John', 'Doe', 'John Doe is a bestselling author known for his mystery novels.', '/img/authors/john-doe.jpg', 'OL12345678'),
('Jane', 'Smith', 'Jane Smith is a renowned science fiction writer with a passion for technology.', '/img/authors/jane-smith.jpg', 'OL23456789'),
('Alice', 'Johnson', 'Alice Johnson is a poet and essayist whose work explores themes of nature and self-discovery.', '/img/authors/alice-johnson.jpg', 'OL34567890'),
('David', 'Brown', 'David Brown is a historian specializing in ancient civilizations and empires.', '/img/authors/david-brown.jpg', 'OL45678901');

select * from autor;

drop table if exists livro;
create table livro(
	id int not null auto_increment primary key,
    isbn varchar(13),
    titulo varchar(90) not null,
    subtitulo varchar(180),
    img_url varchar(180) default '/img/livros/sem-capa.png',
    editora_id int,
    edition int,
    section varchar(90) not null,
    ano_pub int,
    page_count int,
    descr varchar(600),
    disponibilidade tinyint(1) default 1,
    estoque int default 1
);

drop table if exists genero;
create table genero(
	id int not null auto_increment primary key,
    nome varchar(90) not null,
	descr varchar(300)
);
INSERT INTO genero (nome, descr)
VALUES
    ('Action', 'Action movies typically involve fast-paced sequences, explosions, and intense physical activities.'),
    ('Drama', 'Drama films focus on character development and emotional themes, often dealing with personal struggles and conflicts.'),
    ('Comedy', 'Comedies aim to entertain and amuse, using humor and satire to create laughter and joy among the audience.'),
    ('Science Fiction', 'Sci-fi movies explore futuristic and speculative concepts, often involving advanced technology, space travel, and extraterrestrial life.'),
    ('Horror', 'Horror films are designed to scare and unsettle the audience, often featuring supernatural elements, monsters, or psychological horror');

select * from genero;

drop table if exists editora;
create table editora(
	id int not null auto_increment primary key,
    nome varchar(90) not null,
	descr varchar(300)
);
insert into editora(nome, descr) values("asdfasd", "sdfafdsa");
select * from editora;
delete from editora;
drop table if exists livro_genero;
create table livro_genero(
	id int not null auto_increment primary key,
    livro_id int not null,
    genero_id int not null
);

drop table if exists livro_autor;
create table livro_autor(
	id int not null auto_increment primary key,
    livro_id int not null,
    autor_id int not null
);