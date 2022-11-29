-- Criando database da companhia
create database companhia;
use companhia;

-- Criando tabela do Empregado
create table Empregado(
	Nome_Empregado varchar(100) not null,
    Rua varchar(50),
    Cidade varchar(50),
    primary key (Nome_Empregado)
);

-- Criando tabela da Companhia
create table Companhia(
	Nome_Companhia varchar(100) not null,
    Cidade varchar(50),
    primary key (Nome_Companhia)
);

-- Criando a relação Trabalha_Para
create table Trabalha_Para(
	Nome_Empregado varchar(100) not null,
    Nome_Companhia varchar(100) not null,
    Salario double,
    primary key (Nome_Empregado, Nome_Companhia)
);

-- Criando constraint de chave estrangeira de Trabalha_Para -> Empregado (Nome_Empregado)
alter table Trabalha_Para add constraint FK_empregado
foreign key (Nome_Empregado) references Empregado (Nome_Empregado);

-- Criando constraint de chave estrangeira de Trabalha_Para -> Companhia (Nome_Companhia)
alter table Trabalha_Para add constraint FK_Companhia
foreign key (Nome_Companhia) references Companhia (Nome_Companhia);