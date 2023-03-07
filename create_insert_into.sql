
use dbteste;
create table tbUsuario(
id_usuario int auto_increment primary key,
usuario varchar (30) not null,
fone int (15),
login varchar (12) not null,
senha int (10) not null
);


select * from tbUsuario;


insert into tbUsuario
(id_usuario, usuario, fone, login, senha)
values (002, 'joao', 99999999, 'joaosilva', 1234567),
       (003, 'marcelo', 88888888, 'marcelolopes', 12345678),
       (004, 'clara', 77777777, 'clarasilva', 99999999),
       (005, 'rafael', 66666666, 'rafaelmarque', 8888888);


describe tbUsuario;


alter table tbUsuario add column sexo char (10);
alter table tbUsuario change column sexo sexo enum('M','F','Outro');
