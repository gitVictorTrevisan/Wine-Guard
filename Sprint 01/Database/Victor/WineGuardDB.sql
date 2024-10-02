create database WineGuardDB;
use WineGuardDB;

create table Empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
email varchar(100),
cnpj char(18),
cep char(9),
endereco varchar(200),
telefone char(14),
tipoEmpresa varchar (45),
constraint chkTipo check (tipoEmpresa in('MEI', 'ME', 'EPP', 'EI', 'EIRELI', 'SLU', 'LTDA', 'SA'))
);

insert into Empresa(nome, email, cnpj, cep, endereco, telefone, tipoEmpresa) values
	('Empresa E', 'contato@empresaE.com', '44.444.444/0001-44', '44444-444', 'Rua E, 500', '(51) 5678-9012', 'MEI'),
	('Empresa D', 'contato@empresad.com', '33.333.333/0001-33', '33333-333', 'Rua D, 400', '(41) 4567-8901', 'ME'),
    ('Empresa C', 'contato@empresac.com', '22.222.222/0001-22', '22222-222', 'Rua C, 300', '(31) 3456-7890', 'EPP'),
    ('Empresa B', 'contato@empresab.com', '11.111.111/0001-11', '11111-111', 'Rua B, 200', '(21) 2345-6789', 'EI'),
    ('Empresa A', 'contato@empresaa.com', '00.000.000/0001-00', '00000-000', 'Rua A, 100', '(11) 1234-5678', 'LTDA');





create table dadosUmidade(
idUmidade int primary key auto_increment,
minima int,
media int,
maxima int);

insert into dadosUmidade (minima, media, maxima) values 
(55, 64, 77),
(43, 55, 60),
(52, 60, 70),
(43, 55, 61),
(46, 51, 61);


create table dadosTemperatura(
idTemperatura int primary key auto_increment,
minima int,
media int,
maxima int);

INSERT INTO dadosTemperatura (minima, media, maxima)
VALUES 
(14, 19, 24),
(13, 18, 23),
(12, 17, 22),
(11, 16, 21),
(10, 15, 20);
