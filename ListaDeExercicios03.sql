--Josmar Saiefert

--01

create database LojaDiscos
use LojaDiscos

create table disco(
CodDisco int not null,
CodGravadora int not null,
Nome varchar(60),
primary key (CodDisco)
)

create table disco_musica(
CodDisco int not null,
CodMusica int not null,
primary key (CodDisco, CodMusica)
)

create table musica(
CodMusica int not null,
CodEstilo int not null,
Nome varchar(60),
Duracao numeric(4,2) default 3,
check (Duracao <= 20),
primary key (CodMusica)
)

create table gravadora(
CodGravadora int not null,
Descricao varchar(60),
primary key (CodGravadora)
)

create table estilo(
CodEstilo int not null,
Descricao varchar(60),
primary key (CodEstilo)
)

create table musica_artista(
CodMusica int not null,
CodArtista int not null,
primary key (CodMusica, CodArtista)
)

create table artista(
CodArtista int not null,
Nome varchar(60),
primary key (CodArtista)
)

alter table disco
add foreign key (CodGravadora) references gravadora

alter table disco_musica
add foreign key (CodDisco) references disco

alter table disco_musica
add foreign key (CodMusica) references musica

alter table musica
add foreign key (CodEstilo) references estilo

alter table musica_artista
add foreign key (CodMusica) references musica

alter table musica_artista 
add foreign key (CodArtista) references artista

--02

create database RevendedoraVeiculos
use RevendedoraVeiculos

create table automovel(
Codigo int not null,
Ano int not null,
Fabricante varchar(50),
Modelo varchar(50),
Pais varchar(50),
PrecoTabela money,
primary key (Codigo, Ano)
)

create table negocio(
Codigo int not null,
Ano int not null,
Identidade int not null,
CNPJ char(14) not null,
Data datetime not null,
PrecoVenda numeric(11,2),
primary key (Codigo, Ano, Identidade, CNPJ, Data)
)

create table cliente(
Identidade int not null,
Nome varchar(50) not null,
Endereco varchar(50),
CPF char(11),
primary key (Identidade)
)
 
create table estoque(
Codigo int not null,
Ano int not null,
CNPJ char(14) not null,
Quantidade int not null,
check (Quantidade <= 1 and Quantidade >=10),
primary key (Codigo, Ano, Quantidade)
)

create table revendedor(
CNPJ char(14) not null,
Nome varchar(50) not null,
Proprietario varchar(50),
Cidade varchar(50) default 'Campo Grande' ,
Estado char(2) default 'MS',
primary key (CNPJ)
)

alter table negocio
add foreign key (Codigo, Ano) references automovel

alter table negocio 
add foreign key (Identidade) references cliente

alter table negocio 
add foreign key (CNPJ) references revendedor

alter table estoque
add foreign key (Codigo, Ano) references automovel

alter table estoque 
add foreign key (CNPJ) references revendedor

--03

create database CadastroVeiculos
use CadastroVeiculos

create table veiculo(
Placa char(7) not null,
CodCategoria int,
CodModelo int,
CodMarca int,
AnoFabricacao int,
check (AnoFabricacao >= 2005 and AnoFabricacao <=2015),
primary key (Placa)
)

create table categoria(
CodCategoria int not null,
Descricao varchar(60) not null,
primary key (CodCategoria)
)

create table veiculo_proprietario(
Placa char(7) not null,
CodProprietario int not null,
DataCompra datetime not null,
check (DataCompra <= CONVERT(CHAR(10), GETDATE(),103)),
primary key (Placa, CodProprietario, DataCompra)
)

create table modelo(
CodMarca int not null,
CodModelo int not null,
Descricao varchar(60) not null,
primary key (CodMarca, CodModelo)
)

create table proprietario(
CodProprietario int not null,
Nome varchar(60) not null,
primary key (CodProprietario)
)

create table marca(
CodMarca int not null,
Descricao varchar(60) not null,
primary key (CodMarca)
)

alter table veiculo
add foreign key (CodMarca) references marca

alter table veiculo 
add foreign key (CodModelo) references modelo

alter table veiculo
add foreign key (CodCategoria) references categoria

alter table veiculo_proprietario
add foreign key (Placa) references veiculo

alter table veiculo_proprietario
add foreign key (CodProprietario) references proprietario

alter table modelo
add foreign key (CodMarca) references marca
