drop database if exists arquive;
create database arquive;

use arquive;

drop table if exists autor;
create table autor(
	id int not null auto_increment primary key,
    nome varchar(90) not null,
    sobrenome varchar(180),
    biografia text(300),
    foto varchar(90) default '/img/autores/sem-foto.png'
);

INSERT INTO autor (nome, sobrenome, biografia, foto) VALUES
('John', 'Doe', 'John Doe is a bestselling author known for his mystery novels.', '/img/authors/john-doe.jpg'),
('Jane', 'Smith', 'Jane Smith is a renowned science fiction writer with a passion for technology.', '/img/authors/jane-smith.jpg'),
('Alice', 'Johnson', 'Alice Johnson is a poet and essayist whose work explores themes of nature and self-discovery.', '/img/authors/alice-johnson.jpg'),
('David', 'Brown', 'David Brown is a historian specializing in ancient civilizations and empires.', '/img/authors/david-brown.jpg');

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

drop table if exists editora;
create table editora(
	id int not null auto_increment primary key,
    nome varchar(90) not null,
	descr varchar(300)
);

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