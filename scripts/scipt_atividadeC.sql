show databases;

use database_atividadec;

#Dados do funcionário
create table tbl_funcionario(
	id					int not null auto_increment primary key,
	nome				varchar(100) not null,
    email				varchar(255) not null,
	data_nascimento 	date,
    cpf					varchar(14)
);

create table tbl_cargo(
	id			int not null auto_increment primary key,
	nome		varchar(30) not null
);

create table tbl_sexo(
	id			int not null auto_increment primary key,
    sexo		varchar(11) not null,
    sigla		varchar(4)  not null
);

create table tbl_telefone(
	id			int not null auto_increment primary key,
    numero		varchar(17)
);

create table tbl_tipo_telefone(
	id			int not null auto_increment primary key,
    tipo		varchar(13)
);

#Dados relacionados ao Setor
create table tbl_setor(
	id			int not null auto_increment primary key,
    codigo		varchar(7) not null
);
#Tabela intermediária
create table tbl_setor_especialidade(
	id						int not null auto_increment primary key,
    id_setor				int not null,
    id_especialidade 		int not null,
    
    constraint FK_SETOR_SETORESPECIALIDADE
    foreign key (id_setor)
    references tbl_setor(id),
    
    constraint FK_ESPECIALIDADE_SETORESPECIALIDADE
    foreign key(id_especialidade)
    references tbl_especialidade(id)
);

create table tbl_especialidade(
	id					int not null auto_increment primary key,
    especialidade		varchar(30) not null
);

#Dados relacionados a peça
create table tbl_peca(
	id					int not null auto_increment primary key,
    nome				varchar(80) not null,
    valor				decimal(15,2) not null,
    peso				decimal(7,2) not null,
    qtde_estoque		int not null,
    data_fabricacao		date
);

create table tbl_dimensoes(
	id					int not null auto_increment primary key,
    comprimento			float not null,
    altura				float not null,
	id_peca				int not null,
    
    constraint FK_PECA_DIMENSOES
    foreign key(id_peca)
    references tbl_peca(id)
);

#Dados relacionados a matéria prima
create table tbl_materia_prima(
	id					int not null auto_increment primary key,
    nome				varchar(30),
    data_entrega		date not null,
    descricao			text,
    composicao			text not null,
    volume				decimal(7,2)    
);


#Tabelas de relacionamento

#Relacionamento peça -> setor
create table tbl_peca_setor(
	id				int not null auto_increment primary key,
    id_peca			int not null,
    id_setor		int not null,
    
    constraint FK_PECA_PECASETOR
    foreign key(id_peca)
    references tbl_peca(id),
    
    constraint FK_SETOR_PECASETOR
    foreign key (id_setor)
    references tbl_setor(id)
);





