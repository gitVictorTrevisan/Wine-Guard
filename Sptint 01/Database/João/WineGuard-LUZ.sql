create database WineGuard;
use WineGuard;

create table cadastroEmpresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
email varchar(60),
cnpj char(14),
cep char(8),
endereco varchar(200),
telefone char(11),
tipoEmpresa varchar (45),
constraint chkTipo check (tipoEmpresa in('MEI', 'ME', 'EPP', 'EI', 'EIRELI', 'SLU', 'LTDA', 'SA'))
);

insert into cadastroEmpresa(nome, email, cnpj, cep, endereco, telefone, tipoEmpresa) values
('Adega do Vale', 'contato@adegadovale.com.br', '12345678000195', '95700000', 'Estrada do Vinho, 1200, Vale dos Vinhedos, Bento Gonçalves - RS', '54987654321', 'ME'),
('Vinícola Serra Azul', 'atendimento@serraazulvinhos.com.br', '98765432000122', '95042000', 'Rodovia RS-444, Km 17, Serra Gaúcha, Garibaldi - RS', '54987654322', 'EPP'),
('Quinta das Uvas', 'info@quintadasuvas.com.br', '32165498000176', '91340000', 'Rua das Vinhas, 456, Zona Rural, Caxias do Sul - RS', '54987654323', 'LTDA');

select nome as 'Nome', email as 'E-mail', 
cnpj as 'CNPJ',
 endereco as 'Endereço', 
 telefone as 'Telefone', 
 tipoEmpresa as 'Tipo da Empresa' 
 from cadastroEmpresa;

create table controleUmidade(
idUmidade int primary key auto_increment,
umidadeMinima int,
umidadeMedia int,
umidadeMaxima int);

insert into controleUmidade (umidadeMinima, umidadeMedia, umidadeMaxima) values 
(50, 60, 70),
(45, 55, 65),
(52, 62, 72),
(48, 58, 68),
(47, 57, 67);

select umidadeMinima as 'Umidade Mínima',
 umidadeMedia as 'Umidade Média',
 umidadeMaxima as 'Umidade Máxima'
 from controleUmidade;

create table controleTemperatura(
idTemperatura int primary key auto_increment,
TemperaturaMinima int,
TemperaturaMedia int,
TemperaturaMaxima int);

INSERT INTO controleTemperatura (TemperaturaMinima, TemperaturaMedia, TemperaturaMaxima)
VALUES 
(12, 15, 18),
(10, 14, 17),
(11, 16, 20),
(13, 15, 19),
(12, 16, 21);

select temperaturaMinima as 'Temperatura Mínima',
temperaturaMedia as 'Temperatura Média',
temperaturaMaxima as 'Temperatura Máxima'
 from controleTemperatura;