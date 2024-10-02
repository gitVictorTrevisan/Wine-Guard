CREATE DATABASE WineGuard;

USE WineGuard;

CREATE TABLE usuario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	username VARCHAR(50),
	email VARCHAR(50),
	telefone CHAR(11),
	senha VARCHAR(20),
	CPF_CNPJ VARCHAR(14),
	dtNascimento DATE,
	endereco VARCHAR(200)
);

CREATE TABLE alerta(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dtAlerta DATETIME,
    tipo_alerta VARCHAR(20),
    status_alerta VARCHAR(20),
    prioridade VARCHAR(20),
    CONSTRAINT chkTipo_Alerta CHECK(tipo_alerta in ('Temperatura', 'Umidade')),
    CONSTRAINT chkStatus CHECK(status_alerta in ('Aberto', 'Resolvido', 'Em Analise')),
    CONSTRAINT chkPrioridade CHECK( prioridade in('Alta', 'Media','Baixa'))
);

CREATE TABLE SensorTemperatura(
	id INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(50),
    dtLeitura DATETIME,
    temperatura_atual INT
);

CREATE TABLE SensorUmidade(
	id INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(50),
    dtLeitura DATETIME,
    umidade_atual INT
);

CREATE TABLE contatoCliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Nome varchar(45),
    Telefone char (11),
    Email varchar(45),
    mensagem VARCHAR(255)
);

INSERT INTO usuario VALUES
	(DEFAULT, 'João Silva', 'jsilva', 'joao.silva@email.com', '11987654321', 'senha123', '12345678901', '1990-04-06', 'Rua das Flores, 123'),
	(DEFAULT, 'Maria Oliveira', 'moliveira', 'maria.oliveira@email.com', '11912345678', 'senha456', '10987654321', '1985-09-10', 'Avenida Paulista, 1000'),
	(DEFAULT, 'Carlos Souza', 'csouza', 'carlos.souza@email.com', '11923456789', 'senha789', '98765432100', '1992-07-22', 'Rua dos Pinheiros, 250'),
	(DEFAULT, 'Fernanda Costa', 'fcosta', 'fernanda.costa@email.com', '11934567890', 'senha101', '34567890123', '1988-02-03', 'Praça da Liberdade, 45'),
	(DEFAULT, 'Rafael Almeida', 'ralmeida', 'rafael.almeida@email.com', '11945678901', 'senha202', '56789012345', '1995-11-11', 'Rua 25 de Março, 789'),
    (DEFAULT, 'Gabriela Martins', 'gmartins', 'gabriela.martins@email.com', '11956789012', 'senha303', '78901234567', '1993-05-18', 'Avenida Brasil, 456'),
	(DEFAULT, 'Pedro Ferreira', 'pferreira', 'pedro.ferreira@email.com', '11967890123', 'senha404', '89012345678', '1991-12-30', 'Rua Augusta, 111'),
	(DEFAULT, 'Ana Beatriz Lima', 'ablima', 'ana.lima@email.com', '11978901234', 'senha505', '90123456789', '1987-06-25', 'Rua Consolação, 321'),
	(DEFAULT, 'Lucas Rocha', 'lrocha', 'lucas.rocha@email.com', '11989012345', 'senha606', '23456789012', '1994-08-07', 'Avenida Faria Lima, 999')
;

INSERT INTO alerta VALUES 
	(DEFAULT, '2024-09-01 08:30:00', 'Temperatura', 'Aberto', 'Alta'),
	(DEFAULT, '2024-09-02 09:15:00', 'Umidade', 'Resolvido', 'Média'),
	(DEFAULT, '2024-09-03 10:00:00', 'Temperatura', 'Em Analise', 'Baixa'),
	(DEFAULT, '2024-09-04 11:45:00', 'Umidade', 'Aberto', 'Alta'),
	(DEFAULT, '2024-09-05 12:30:00', 'Temperatura', 'Resolvido', 'Média'),
	(DEFAULT, '2024-09-06 13:15:00', 'Umidade', 'Em Analise', 'Baixa'),
	(DEFAULT, '2024-09-07 14:00:00', 'Temperatura', 'Aberto', 'Alta'),
	(DEFAULT, '2024-09-08 15:30:00', 'Umidade', 'Resolvido', 'Média'),
	(DEFAULT, '2024-09-09 16:45:00', 'Temperatura', 'Em Analise', 'Baixa'),
	(DEFAULT, '2024-09-10 17:00:00', 'Umidade', 'Aberto', 'Alta')
;

INSERT INTO sensorTemperatura VALUES
	(DEFAULT, 'Sala 1', '2024-09-01 08:30:00', 15),
	(DEFAULT, 'Sala 2', '2024-08-20 09:00:00', 12),
	(DEFAULT, 'Sala 3', '2024-01-12 10:00:00', 21),
	(DEFAULT, 'Sala 4', '2023-04-05 11:00:00', 22),
	(DEFAULT, 'Sala 5', '2023-09-25 12:00:00', 6),
	(DEFAULT, 'Sala 6', '2022-01-20 13:00:00', 24),
	(DEFAULT, 'Sala 7', '2022-12-01 14:00:00', 32),
	(DEFAULT, 'Sala 8', '2020-02-11 15:00:00', 23),
	(DEFAULT, 'Sala 9', '2020-08-15 16:00:00', 21),
	(DEFAULT, 'Sala 10', '2020-12-01 17:00:00', 22)
;

INSERT INTO sensorUmidade VALUES
	(DEFAULT, 'Sala 1', '2024-08-11 08:30:00', 95),
	(DEFAULT, 'Sala 2', '2024-06-10 09:00:00', 86),
	(DEFAULT, 'Sala 3', '2024-03-01 10:00:00', 74),
	(DEFAULT, 'Sala 4', '2022-12-25 11:00:00', 75),
	(DEFAULT, 'Sala 5', '2022-09-01 12:00:00', 67),
	(DEFAULT, 'Sala 6', '2021-11-11 13:00:00', 58),
	(DEFAULT, 'Sala 7', '2021-07-10 14:00:00', 56),
	(DEFAULT, 'Sala 8', '2021-03-20 15:00:00', 57),
	(DEFAULT, 'Sala 9', '2020-09-01 16:00:00', 65),
	(DEFAULT, 'Sala 10', '2019-09-01 17:00:00', 76)
;

INSERT INTO contatoCliente VALUES
	(DEFAULT, 'Juliana Freitas', '11987654321', 'juliana.freitas@email.com', 'Gostaria de saber mais sobre o serviço de monitoramento de temperatura.'),  
	(DEFAULT, 'Roberto Lima', '11912345678', 'roberto.lima@email.com', 'Estou com dúvidas sobre os sensores de umidade.'),  
	(DEFAULT, 'Fernanda Oliveira', '11923456789', 'fernanda.oliveira@email.com', 'Preciso de suporte para configurar o sistema.'),  
	(DEFAULT, 'Carlos Menezes', '11934567890', 'carlos.menezes@email.com', 'Gostaria de agendar uma demonstração do sistema.')
;

SELECT * FROM usuario;

SELECT * FROM usuario
ORDER BY dtNascimento;

SELECT * FROM usuario
WHERE telefone LIKE '11%';

SELECT nome as 'Nome', username as 'Nome de login', dtNascimento as 'Data Nascimento' FROM usuario;

SELECT * FROM alerta;

SELECT * FROM alerta
WHERE dtAlerta LIKE '%17:%';

SELECT * FROM alerta
ORDER BY dtAlerta desc;

SELECT * FROM alerta 
WHERE prioridade = 'Alta';

SELECT * FROM alerta 
WHERE tipo_alerta = 'umidade';

SELECT * FROM sensorUmidade;

SELECT * FROM sensorUmidade 
WHERE dtLeitura >= '2024-01-10';

SELECT * FROM sensorTemperatura;

SELECT * FROM sensorTemperatura
WHERE dtLeitura < '2021-12-31';

SELECT * FROM contatoCliente;

SELECT * FROM contatoCliente
ORDER BY nome;











