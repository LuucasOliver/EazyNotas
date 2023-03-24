create table funcionario(
	id int auto_increment primary key,
	nivel_acesso varchar(20) not null,
	nome varchar(50) not null,
	sexo char(1) not null,
	cargo varchar(50) not null,
	nascimento varchar(15) not null,
	telefone varchar(15),
	email varchar(50) not null
);

create table log_funcionario(
	id int auto_increment primary key,
    id_funcionario int not null,
	cargo_anterior varchar(50) not null,
    cargo_atual varchar(50) not null,
    data_alteracao datetime not null,
    foreign key (id_funcionario) references funcionario(id)
);

insert into funcionario (
	nivel_acesso,
    nome,
    sexo,
    cargo,
    nascimento,
    telefone, 
    email) values (
		'master',
        'Izauir Guilherme Bernardo dos Santos', 
        'M', 
        'Programador', 
        convert('1999-09-18', date), 
        '(11)97369-9232', 
        'izauirguilherme@hotmail.com');
        

create table produto(
	id int auto_increment primary key,
	nome varchar(30) not null,
	marca varchar(50) not null,
	preco_venda float not null,
    bit_ativo bit default 1,
	quantidade int not null
	);

create table estoque(
	id_produto int auto_increment primary key,
	quantidade int not null,
    foreign key (id_produto) references produto(id)
	);
    
insert into produto (
    nome, 
    marca, 
    preco_venda, 
    quantidade) values ( 
        'Chocolate', 
        'Cacau Show', 
        50.00, 
        1);
        
create table venda(
	id int auto_increment primary key,
    id_produto int not null,
	valor float,
    quantidade int not null,
	data date,
    foreign key (id_produto) references produto(id)
	);