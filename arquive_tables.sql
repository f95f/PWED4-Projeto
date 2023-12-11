drop database if exists arquive;
create database arquive;

use arquive;

drop table if exists autor;
create table autor(
	id int not null auto_increment primary key,
    olid varchar(15),
    nome varchar(120) not null,
    biografia text(300),
    foto varchar(90) default '/img/autores/sem-foto.png'
);
INSERT INTO autor (nome, biografia, foto, olid) VALUES
('John Doe', 'John Doe is a bestselling author known for his mystery novels.', '/img/authors/john-doe.jpg', 'OL12345678'),
('Jane Smith', 'Jane Smith is a renowned science fiction writer with a passion for technology.', '/img/authors/jane-smith.jpg', 'OL23456789'),
('Alice Johnson', 'Alice Johnson is a poet and essayist whose work explores themes of nature and self-discovery.', '/img/authors/alice-johnson.jpg', 'OL34567890'),
('David Brown', 'David Brown is a historian specializing in ancient civilizations and empires.', '/img/authors/david-brown.jpg', 'OL45678901');
select * from autor;
-- delete from autor;

drop table if exists livro;
create table livro(
	idLivro int not null auto_increment primary key,
    isbn varchar(13) unique,
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
	('Ficção Científica', 'Livros que exploram cenários futuristas, tecnologias avançadas e conceitos científicos imaginativos.'),
    ('Fantasia', 'Obras que apresentam elementos sobrenaturais, mágicos ou mundos fictícios.'),
    ('Romance', 'Histórias que se concentram principalmente em relacionamentos interpessoais e amorosos.'),
    ('Mistério', 'Livros com enredos intrincados e reviravoltas, frequentemente envolvendo crimes ou situações enigmáticas.'),
    ('Não Ficção', 'Livros baseados em fatos reais, como biografias, ensaios, ou livros de referência.'),
    ('Terror', 'Narrativas que visam provocar medo, suspense e tensão psicológica nos leitores.'),
    ('Aventura', 'Histórias cheias de ação, viagens e desafios emocionantes.'),
    ('Autoajuda', 'Livros que oferecem conselhos e orientações para o desenvolvimento pessoal.'),
    ('História', 'Obras que narram eventos passados, oferecendo insights sobre períodos históricos.'),
    ('Poesia', 'Expressão artística por meio de versos, explorando emoções e reflexões.');
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
('Ficção', 'Livros de ficção, incluindo romances, ficção científica, fantasia, etc.'),
    ('Não Ficção', 'Livros baseados em fatos reais, como biografias, ensaios, livros de referência, etc.'),
    ('História', 'Livros que abrangem períodos históricos e eventos passados.'),
    ('Arte e Fotografia', 'Livros relacionados a arte, fotografia e design.'),
    ('Ciência e Tecnologia', 'Livros científicos, tecnológicos e acadêmicos.'),
    ('Infantil', 'Livros destinados ao público infantil, incluindo livros ilustrados e de histórias.'),
    ('Autoajuda e Desenvolvimento Pessoal', 'Livros que oferecem conselhos e orientações para o desenvolvimento pessoal.'),
    ('Referência', 'Livros de consulta rápida, dicionários, enciclopédias, etc.'),
    ('Mistério e Suspense', 'Livros com enredos intrincados e de suspense.'),
    ('Viagens', 'Livros relacionados a viagens, guias turísticos e aventuras.');
select * from section;
-- delete from section;

INSERT INTO editora (nome, descr)
VALUES
	('Penguin Random House', 'Uma das maiores e mais conhecidas editoras.'),
    ('HarperCollins', 'Uma editora global com uma ampla variedade de títulos.'),
    ('Simon & Schuster', 'Publica uma variedade diversificada de livros em vários gêneros.'),
    ('Macmillan Publishers', 'Conhecida por suas publicações acadêmicas e educacionais.'),
    ('Hachette Book Group', 'Publica livros tanto para adultos quanto para crianças.'),
    ('Scholastic Corporation', 'Especializa-se na publicação de livros para jovens leitores e materiais educativos.'),
    ('Oxford University Press', 'Concentra-se na publicação acadêmica e científica.'),
    ('Wiley', 'Publica livros científicos, técnicos e acadêmicos.'),
    ('Random House', 'Uma divisão da Penguin Random House, conhecida por sua ficção literária e não-ficção.');
SELECT * FROM editora;
-- delete from editora;

drop table if exists usuario;
create table usuario(
	id int not null auto_increment primary key,
    email varchar(60) not null unique,
    senha varchar(60) not null,
    nivel varchar(15) not null default('cliente'),
    telefone varchar(15),
    nome varchar(60) not null,
    acesso varchar(15) not null default('ativo')
);

insert into usuario
	(email, senha, nivel, telefone, nome)
values
	('felipe@email.com', '12345', 'admin','1199998888', 'Teste 2')
;
select * from usuario;

drop table if exists livro_genero;
create table livro_genero(
    livro_id int not null,
    genero_id int not null,
	constraint fk_livro_genero foreign key (livro_id) references livro(idLivro),
	constraint fk_genero foreign key (genero_id) references genero(id)
);
select * from livro_genero;

drop table if exists livro_autor;
create table livro_autor(
    livro_id int not null,
    autor_id int not null,
	constraint fk_livro_autor foreign key (livro_id) references livro(idLivro),
	constraint fk_autor foreign key (autor_id) references autor(id)
);
select * from livro_autor;