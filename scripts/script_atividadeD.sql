create database db_atividadeD;
use db_atividadeD;
show databases;

#Dados relacionados ao advogado
create table tbl_advogado(
	id						int not null auto_increment primary key,
	nome					varchar(80) not null,
    cpf						varchar(16) not null,
	data_admissao			date not null,
    funcao_exercida			varchar(30) not null
);

create table tbl_OAB(
	id				int not null auto_increment primary key,
    numero_OAB		varchar(10) not null,
    sigla_estado	varchar(3),
    id_advogado		int not null,
    
    constraint FK_ADVOGADO_OAB
    foreign key(id_advogado)
    references tbl_advogado(id)
);

create table tbl_advogado_email(
	id				int not null auto_increment primary key,
    id_advogado		int not null,
    id_email		int not null,
    
    constraint FK_ADVOGADO_ADVOGADOEMAIL
    foreign key(id_advogado)
    references tbl_advogado(id),
    
    constraint FK_EMAIL_ADVOGADO_ADVOGADOEMAIL
    foreign key(id_email)
    references tbl_email(id)
);

create table tbl_advogado_telefone(
	id				int not null auto_increment primary key,
    id_advogado		int not null,
    id_telefone		int not null,
    
    constraint FK_ADVOGADO_ADVOGADOTELEFONE
    foreign key(id_advogado)
    references tbl_advogado(id),
    
    constraint FK_EMAIL_ADVOGADO_ADVOGADOTELEFONE
    foreign key(id_telefone)
    references tbl_telefone(id)
);


#Dados relacionados ao processo
create table tbl_processo(
	id						int not null auto_increment primary key,
	status_causa			boolean not null,
    descricao				text not null,
    data_abertura			date not null,
    data_encerramento 		date not null,
    valor_causa				decimal not null,
    numero_processo			varchar(30) not null,
    id_area_atuacao			int not null,
    id_cliente				int not null,
    
    constraint FK_AREAATUACAO_PROCESSO
    foreign key(id_area_atuacao)
    references tbl_area_atuacao(id),
    
    constraint FK_CLIENTE_PROCESSO
    foreign key(id_cliente)
    references tbl_cliente(id)
);

create table tbl_area_atuacao(
	id				int not null auto_increment primary key,
    area_atuacao	varchar(30) not null
);

#Dados relacionados ao cliente

create table tbl_cliente_pessoa_fisica(
	id			int not null auto_increment primary key,
    nome 		varchar(100) not null,
    cpf			varchar(14) not null,
    email		varchar(255) default null
);

create table tbl_cliente_pessoa_juridica(
	id					int not null auto_increment primary key,
    nome_fantasia 		varchar(80) not null,
    cnpj				varchar(20) not null,
    razao_social		varchar(80) not null
);

create table tbl_email(
	id								int not null auto_increment primary key,
    email							varchar(255) not null,
    id_cliente_pessoa_juridica		int not null,
    
    constraint FK_CLIENTEPESSOAJURIDICA_EMAIL
    foreign key(id_cliente_pessoa_juridica)
    references tbl_cliente_pessoa_juridica(id)
);