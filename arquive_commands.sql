INSERT INTO arquive.livro_autor ( livroId, autorId) VALUES ('39','4');
delete from livro;
delete from livro_autor;
delete from livro_genero;
delete from genero;
delete from section;
select * from livro_autor;
select * from livro_genero;
select * from livro	;
select * from section;
select * from usuario;
select * from editora;
SELECT livro_id, genero_id FROM arquive.livro_genero WHERE genero_id = '26';

update autor set foto = 'img/vendor/sem-foto.png';
SELECT id, olid, nome, biografia, foto FROM arquive.autor