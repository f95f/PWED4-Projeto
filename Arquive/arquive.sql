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