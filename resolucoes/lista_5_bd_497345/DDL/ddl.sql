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

-- Criando tabela de Gerência
create table Gerencia(
	Nome_Empregado varchar(100) not null,
    Nome_Gerente varchar(100) not null,
    primary key (Nome_Empregado, Nome_Gerente)
);

-- Fazendo com que a coluna Nome_Empregado de Gerencia se referencia a mesma coluna de Empregado
alter table Gerencia add constraint FK_Nome_Empregado_Gerencia
foreign key (Nome_Empregado) references Empregado (Nome_Empregado);

-- Fazendo com que a coluna Nome_Gerente de Gerencia se referencia à coluna 
-- Nome_Empregado da coluna de Empregado
alter table Gerencia add constraint FK_Nome_Gerente_Empregado
foreign key (Nome_Gerente) references Empregado (Nome_Empregado);