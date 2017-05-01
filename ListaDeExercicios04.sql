--Josmar Saiefert

create database Empresa
use Empresa

create table empregado(
CodEmpregado int not null,
Nome varchar(60) not null,
DataNasc datetime,
Sexo char(1),
Salario money,
Endereco varchar(60),
CodDepartamento int,
CodSupervisor int,
primary key (CodEmpregado)
)

create table departamento(
CodDepartamento int not null,
NomeDepartamento varchar(60) not null,
CodGerente int,
DataInicioGer datetime,
CodCidade int not null,
primary key (CodDepartamento)
) 

create table cidade(
CodCidade int not null,
NomeCidade varchar(60) not null,
primary key (CodCidade)
)

create table empregado_projeto(
CodEmpregado int not null,
CodProjeto int not null,
Horas int,
primary key (CodEmpregado, CodProjeto)
)

create table dependente(
CodEmpregado int not null,
CodDependente int not null,
NomeDep varchar(60) not null,
SexoDep char(1),
DataNascDep datetime,
Parentesco char(1),
primary key (CodEmpregado, CodDependente)
)

create table projeto(
CodProjeto int not null,
NomeProjeto varchar(60) not null,
CodDepartamento int not null,
primary key (CodProjeto)
)

alter table empregado
add foreign key (CodSupervisor) references empregado

alter table empregado
add foreign key (CodDepartamento) references departamento

alter table departamento
add foreign key (CodGerente) references empregado

alter table departamento
add foreign key (CodCidade) references cidade

alter table empregado_projeto
add foreign key (CodEmpregado) references empregado

alter table empregado_projeto
add foreign key (CodProjeto) references projeto

alter table dependente
add foreign key (CodEmpregado) references empregado

alter table projeto 
add foreign key (CodDepartamento) references departamento

--01

insert into cidade
values (1, 'Campo Grande')

insert into cidade
values (2, 'Rio Brilhante')

insert into cidade
values (3, 'Bonito')

insert into cidade
values (4, 'Sidrolandia')

insert into cidade
values (5, 'Maracaju')

insert into cidade
values (6, 'Ponta Pora')

--02

update cidade
set NomeCidade = 'Maracaju' where CodCidade = 5

--03

delete from cidade 
where CodCidade = 6

--04

insert into departamento
values (1, 'Financeiro', null, null, 2)

--05

insert into empregado
values (1, 'Josmar', '1992-08-26',null, 1600.00, null, null, null)

--06

update empregado
set Sexo = 'M', Endereco = 'Rua Pirituba' where CodEmpregado = 1

--07

delete from departamento
where CodGerente is null

--08

update empregado
set Salario = (Salario + (Salario * (10/100))) 

--09

delete from empregado 
where Sexo = 'M' and Salario > 5000.00

--10

insert into projeto 
values (1, 'Ajuste Salarial', 1)






