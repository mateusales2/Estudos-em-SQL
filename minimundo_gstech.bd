# Opção mini-mundo 1
create database gstech;
use gstech;


# Criação de tabelas
create table empregados(
cpf int (11) not null,
nome varchar (15) not null,
telefone int (12),
salario double(6,2),
id_dependente int (3) not null,
id_departamento int (3) not null,
primary key (cpf)
);

select nome, cpf from empregados;

create table departamento_func(
id_departamento int (3) not null,
Departamento varchar (22) not null,
primary key (id_departamento)
);

select empregados.nome, dependente_func.nome
from empregados
inner join dependente_func on empregados.id_dependente = dependente_func.id_dependente;


SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


select * from dependente_func;
select * from departamento_func;
drop table dependente_func;

create table dependente_func(
id_dependente int (3) not null, 
nome varchar (15) not null,
data_nasc timestamp default current_timestamp,
idade int (3) not null,
check (idade >=18) ,
primary key (id_dependente)
);

# Criação das chaves estrangeiras
alter table empregados 
add foreign key (id_departamento) references departamento_func (id_departamento);

alter table empregados
add foreign key (id_dependente) references dependente_func (id_dependente);




# Povoamento de Dados
insert into departamento_func 
values (1,'Marketing'),
	   (2,'Desenvolvimento'),
       (3,'Financeiro'),
       (4,'Gestão de Pessoas');


insert into empregados
values (222222222, 'Maria', 88888888, 2000.50, 2, 4),
       (333333333, 'Marcelo', 77777777, 1000.00, 3, 1),
       (444444444, 'Mateus', 66666666, 8000.00, 4, 2),
       (555555555, 'Giovana', 55555555, 4000.00, 5, 3);
       
       
insert into dependente_func
values (2, 'Leo', '2002-12-03', 20),
       (3, 'William', '2001-10-05', 21),
       (4, 'Ester', '2000-12-03', 22),
       (5, 'Ana', '1999-11-10', 23);
       

SET FOREIGN_KEY_CHECKS=0;

