create database WineGuard;

use WineGuard;

create table armazenamento ( -- tabela 1 
id int primary key auto_increment,
nome_vinho varchar(30),
dt_entrada date,
dt_saida date
);

insert into armazenamento (nome_vinho, dt_entrada, dt_saida) values
('vinho1', '2022-02-24', '2023-03-14'),
('vinho2', '2014-09-12', '2024-08-30'),
('vinho3', '2022-02-15', '2024-05-09'),
('vinho4', '2022-12-28', '2024-03-21'),
('vinho5', '2024-01-01', '2024-03-02');

select * from armazenamento;

desc armazenamento;

use WineGuard;

create table relatorio_ambiente ( -- tabela 2
id_relatório int primary key auto_increment,
dt_medicao date,
tpt_media varchar(30),
umid_media varchar(30)
);

insert into relatorio_ambiente (dt_medicao, tpt_media, umid_media) values
('2024-09-01', '14°C', '70%'),
('2024-09-02', '14°C', '72%'),
('2024-09-03', '13°C', '68%'),
('2024-09-04', '14°C', '91%'),
('2024-09-05', '15°C', '48%');

select * from relatorio_ambiente;

desc relatorio_ambiente;

use WineGuard;

create table aproveitamento ( -- tabela 3
id_vinho int primary key auto_increment,
causa_perda varchar(50),
data_perda date,
valor_perda varchar(30),
qtd_perda varchar(30)
);

insert into aproveitamento (causa_perda, data_perda, valor_perda, qtd_perda) values
('umidade','2024-08-01', 'R$700,00', '1 garrafa'),
('temperatura','2024-08-02', 'R$750,00', '1 garrafa'),
('umidade','2024-08-03', 'R$100,00', '1 garrafa'),
('temperatura','2024-08-04', 'R$200,00', '1 garrafa'),
('temperatura','2024-08-05', 'R$1000,00', '2 garrafa');

select * from aproveitamento;

desc aproveitamento;
