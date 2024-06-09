create database CheckChicken;
use CheckChicken;

-- TABELA DE CADASTRO DE USUARIO
create table cadastro (
idUsuario int primary key auto_increment,
nome varchar(40),
dtNasc date,
telefone char(11),
email varchar(40) not null,
senha varchar(30) not null
);

-- TABELA DE CADASTRO DE EMPRESA
create table empresa (
idEmpresa int primary key auto_increment,
cnpj char(18)not null,
nome varchar(40),
cep char(9),
logadouro varchar(50),
numero int,
estado varchar(30),
cidade varchar(30)
);

-- TABELA DE CADASTRO DE LOTES
create table lote (
idLote int primary key auto_increment,
identificador varchar(30),
qtdGalinha int not null,
idade int not null
);

-- INSERÇÃO DE DADOS
insert into cadastro values 
(default, 'Thiago Machado', '1978-03-12', '11986730087', 'thiagomachado@gmail.com', 'thiago1234'),
(default, 'Nicolas Ferreira', '1982-05-04', '11993960804', 'nicolasferreira@outlook.com', 'Nick1982'),
(default, 'Marcus Viudes', '1979-12-21', '11999943211', 'marcusviudes@hotmail.com', '21@marcus'),
(default, 'Marcela Nogueira', '1984-07-12', '11987650001', 'marcelanogueira@gmail.com', '12071984'),
(default, 'Matheus Joel', '1974-11-01', '11974316804', 'matheusjoel@gmail.com', 'joelmatheus');

insert into empresa values
(default, '63.972.366/0001-42', 'Ferreira Galinhas', '02081-053','Rua das amoras', 134, 'São Paulo', 'Guarulhos'),
(default, '12.462.763/0001-33', 'Agro Mil', '09821-089', 'Rua das laranjas', 355, 'Minas Gerais', 'Juiz de fora'),
(default, '78.123.400/0001-81', 'Chicken Safe', '17821-083', 'Rua das uvas', 1003, 'São Paulo', 'São Paulo'),
(default, '84.525.652/0001-30', 'Aves Pro', '09872-021', 'Rua das mangas', 928, 'Rio grande do sul', 'Agua santa'),
(default, '66.510.333/0001-79', 'Frango&Saude', '02055-050', 'Rua dos abacaxis', 14, 'Rio de Janeiro', 'Itaocara');

insert into lote values
(default, 'Lote 7890', 567, 7),
(default, 'Lote X', 378, 20),
(default, 'Lote verde', 489, 16),
(default, 'Lote 5782', 500, 20),
(default, 'Lote 11B', 287, 4);

-- SELEÇÃO DE DADOS
select * from cadastro;
select * from empresa;
select * from lote;

select nome as 'Nome de Usuario', email as 'Email', telefone as 'Telefone para contato' from cadastro; 

select nome as 'Nome da Empresa', cep as 'CEP', estado as 'Estado' from empresa;

select identificador as 'Identificador do lote', qtdGalinha as 'Quantidade de galinhas', idade as 'Faixa etaria' from lote;

select concat 
('Ola, ', nome, ' Verifique seu email atraves do codigo enviado para: ', email) as 'Verificação' from cadastro
where idUsuario in (1,3,5);

select concat 
('Bem-vindos, ', nome, ' por favor confirme seu endereço cadastrado: ', 
logadouro, ', numero ', numero, ' do estado de ', estado, ' e cidade ', cidade) as 'Localização da Empresa' from empresa; 

select concat
('O ', identificador, ' tem: ', qtdGalinha, ' galinhas na faixa etária de ', idade, ' dias.') as 'Informações de lote' from lote;

select email, senha from cadastro
where nome like '%ra';

select nome, cnpj, cep from empresa
where estado = 'São Paulo';

select identificador, idade as 'Faixa etária' from lote
where qtdGalinha > 450;

