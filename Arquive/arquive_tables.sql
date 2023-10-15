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
-- delete from autor;

drop table if exists livro;
create table livro(
	idLivro int not null auto_increment primary key,
    isbn varchar(13),
    titulo varchar(90) not null,
    subtitulo varchar(180),
    img_url varchar(180) default '/img/livros/sem-capa.png',
    editora_id int,
    edition varchar(10),
    section_id int not null,
    ano_pub int,
    page_count int,
    descr varchar(600),
    disponibilidade varchar(10) default 'false',
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
    ('Science Fiction', 'Books that explore futuristic and speculative concepts.'),
    ('Fantasy', 'Books set in fantastical worlds with magical elements.'),
    ('Mystery', 'Books that involve solving mysteries or crimes.'),
    ('Romance', 'Books centered around love and romantic relationships.'),
    ('Historical Fiction', 'Books set in a historical time period with fictional elements.'),
    ('Thriller', 'Books that create suspense and excitement.'),
    ('Non-Fiction', 'Books based on facts and real-life events.'),
    ('Biography', 'Books detailing the life stories of real individuals.'),
    ('Self-Help', 'Books that offer advice and guidance for personal development.');
select * from genero;
-- delete from genero;

drop table if exists editora;
create table editora(
	id int not null auto_increment primary key,
    nome varchar(90) not null,
	descr varchar(300)
);
select * from editora;

drop table if exists section;
create table section(
	id int not null auto_increment primary key,
    nome varchar(90) not null unique,
    descr varchar(300)
);
INSERT INTO section (nome, descr)
VALUES
    ('Fiction', 'Books of imaginative storytelling and creativity.'),
    ('Non-Fiction', 'Books based on facts and real-life events.'),
    ('Mystery', 'Books that involve solving mysteries or crimes.'),
    ('Science Fiction', 'Books that explore futuristic and speculative concepts.'),
    ('Biography', 'Books detailing the life stories of real individuals.'),
    ('History', 'Books about past events, civilizations, and societies.'),
    ('Self-Help', 'Books that offer advice and guidance for personal development.'),
    ('Romance', 'Books centered around love and romantic relationships.'),
    ('Fantasy', 'Books set in fantastical worlds with magical elements.');
select * from section;
-- delete from section;

INSERT INTO editora (nome, descr)
VALUES
    ('Penguin Random House', 'One of the largest and most well-known publishing companies.'),
    ('HarperCollins', 'A global publishing company with a wide range of titles.'),
    ('Simon & Schuster', 'Publishes a diverse range of books across various genres.'),
    ('Macmillan Publishers', 'Known for its academic and educational publications.'),
    ('Hachette Book Group', 'Publishes books for both adults and children.'),
    ('Scholastic Corporation', 'Specializes in publishing books for young readers and educational materials.'),
    ('Oxford University Press', 'Focuses on academic and scholarly publishing.'),
    ('Wiley', 'Publishes scientific, technical, and academic books.'),
    ('Random House', 'A division of Penguin Random House, known for its literary fiction and non-fiction.');
SELECT * FROM editora;
-- delete from editora;

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