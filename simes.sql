/*
 *Código responsável pela modelagem do banco.
 *Estruturado por Társila Silveira, Rickson Andrade, Pablo Santos, Felipe Alves e Pedro Andrade
 *Codificado por Társila Silveira e Pedro Maure
**/
drop database simes;
create database simes;

use simes;

create table pessoa (
    cpf char(14) primary key,
    nome varchar(100) not null,
    rg char(14) not null unique,
    sexo char(1),
    data_de_nascimento date not null
);

create table servidor(
	cpf_servidor char(14) not null,
    matricula char(7) not null unique,
    foreign key (cpf_servidor) references pessoa(cpf)
);

create table aluno(
	cpf_aluno char(14) not null,
    matricula char(14) not null unique,
    foreign key(cpf_aluno) references pessoa(cpf)
);	

create table terceirizado(
	cpf_terceirizado char(14) not null,
    foreign key(cpf_terceirizado) references pessoa(cpf)
);

create table etiqueta (
	id_etiqueta int primary key auto_increment,
    identificador int(10) not null unique
);

create table atribuicao(
	cpf char(14) not null,
    id_etiqueta int not null,
    ativo boolean not null,
    foreign key (cpf) references pessoa(cpf),
    foreign key (id_etiqueta) references etiqueta(id_etiqueta)
);

create table localizacao(
	id int primary key auto_increment,
    nome varchar(50) not null
);

create table registro(
	horario datetime not null,
    identificador int(10) not null,
    id_local int not null,
    foreign key(id_local) references localizacao(id), 
    foreign key(identificador) references etiqueta(identificador),
	primary key(identificador, horario, id_local)
	
);