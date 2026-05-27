#Criando o database
create database db_exercicio_a_tarde;

#Retorna a lista de databases existentes no Banco de Dados
show databases;

#Ativa o database existente
use db_exercicio_a_tarde;

#Retorna a lista de tabelas existentes no database
show tables;

#Criando tabelas no BD
#Tabela de sexo
create table tbl_sexo(
	id 		int not null auto_increment primary key,
    sigla 	varchar(3) not null,
    sexo 	varchar(15) not null
);

#Mostra toda a estrutura da tabela (tipo dados , PK, FK, etc)
desc tbl_sexo;
describe tbl_sexo;

#Tabela de tipo de telefone
create table tbl_tipo_telefone(
	id		int not null auto_increment primary key,
	tipo	varchar(15) not null
);

#Tabela de categoria de habilitação
create table tbl_categoria(
	id				int not null auto_increment primary key,
    categoria		varchar(5) not null
);

#Tabela de Estado
create table tbl_estado(
	id		int not null auto_increment primary key,
    sigla	varchar(3) not null,
    nome 	varchar(30) not null
);

#Criando tabelas com relacionamento FK

#Tabela de Cliente
create table tbl_cliente(
	id					int not null auto_increment primary key,
    nome 				varchar(100) not null,
    cpf					varchar(18)  not null,
    data_nascimento 	date not null,
    email				varchar(256),
    id_sexo				int not null,#FK
				#FK_Origem_Destino
    constraint	FK_SEXO_CLIENTE #Nome do relacionamento
    foreign key (id_sexo) 		#Define qual será o atributo FK
    references tbl_sexo(id)		#Define de onde virá a FK
);

#Tabela de Telefone
create table tbl_telefone(
	id					int not null auto_increment primary key,
    numero				varchar(25) not null,
    id_tipo_telefone 	int not null,
    id_cliente			int not null,
    
    #Relacionamento tipo_telefone - telefone  
    constraint FK_TIPOTELEFONE_TELEFONE
    foreign key (id_tipo_telefone)
    references tbl_tipo_telefone(id),
    
    #Relacionamento cliente - telefone
    constraint FK_CLIENTE_TELEFONE
    foreign key(id_cliente)
    references tbl_cliente(id)
);

#Excluir o database e todas as suas tabelas
#drop database db_exercicio_a_tarde;
show tables;

#Tabela Habilitação
create table tbl_habilitacao(
	id		int not null auto_increment primary key,
    numero	varchar(10) not null,
    data_valida date not null
);

#Comando que modifica a estrutura de um atributo existente na tabela
alter table tbl_habilitacao
	modify column numero int not null;

#Comando que renomeia a escrita de uma coluna e modifica a estrutura de um dado
alter table tbl_habilitacao
	change column data_valida data_validade date not null;

#Comando que adiciona uma nova coluna
alter table tbl_habilitacao
	add column id_cliente int not null;
    
    
#Comando que adiciona uma coluna existente
alter table tbl_habilitacao
	drop column id_cliente;

#Comando que adiciona uma constraint (Relacionamento)
alter table tbl_habilitacao
	add constraint FK_CLIENTE_HABILITACAO
    foreign key (id_cliente)
    references tbl_cliente(id);
    
#Comando que exclui a relação entre tabelas e a coluna "id_cliente"
alter table tbl_habilitacao
	drop foreign key FK_CLIENTE_HABILITACAO,
	drop id_cliente;
    
desc tbl_habilitacao;