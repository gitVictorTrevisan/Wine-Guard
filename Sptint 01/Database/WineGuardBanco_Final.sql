CREATE DATABASE WineGuard;

USE WineGuard;

CREATE TABLE usuario(
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50) NOT NULL,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone CHAR(11),
	senha VARCHAR(20) NOT NULL,
	cpf_cnpj VARCHAR(14) NOT NULL UNIQUE,
    tipo_pessoa VARCHAR(15) NOT NULL,
    CONSTRAINT chk_tipo_pessoa
    CHECK (tipo_pessoa in ('Fisica', 'Juridica')),
	dtNascimento DATE,
	endereco VARCHAR(200) NOT NULL
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
    temperatura_atual FLOAT(5,2)
);

CREATE TABLE SensorUmidade(
	id INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(50),
    dtLeitura DATETIME,
    umidade_atual FLOAT(5,2)
);

CREATE TABLE contatoCliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Nome varchar(45),
    Telefone char (11),
    Email varchar(45),
    mensagem VARCHAR(255)
);

INSERT INTO usuario (nome, username, email, telefone, senha, cpf_cnpj, tipo_pessoa, dtNascimento, endereco)
VALUES 
('Carlos Oliveira', 'carlos.oliveira', 'carlos.oliveira@example.com', '11987654321', 'senha123', '12345678901', 'Fisica', '1985-05-15', 'Rua das Flores, 123, São Paulo, SP'),
('Fernanda Souza', 'fernanda.souza', 'fernanda.souza@example.com', '11976543210', 'senha456', '98765432109', 'Fisica', '1992-10-20', 'Avenida Paulista, 456, São Paulo, SP'),
('João Almeida', 'joao.almeida', 'joao.almeida@example.com', '11987651234', 'senha321', '23456789012', 'Fisica', '1988-03-22', 'Rua do Sol, 789, Rio de Janeiro, RJ'),
('Maria Lima', 'maria.lima', 'maria.lima@example.com', '11976549876', 'senha654', '34567890123', 'Fisica', '1975-07-30', 'Avenida Brasil, 101, Brasília, DF'),
('Consultoria XYZ', 'consultoria.xyz', 'contato@xyz.com', '1133334444', 'senha789', '12345678000199', 'Juridica', NULL, 'Rua das Empresas, 1020, São Paulo, SP'),
('Empresa ABC', 'empresa.abc', 'contato@abc.com', '1122223333', 'senha987', '98765432000188', 'Juridica', NULL, 'Avenida das Nações, 1500, Rio de Janeiro, RJ'),
('Ana Pereira', 'ana.pereira', 'ana.pereira@example.com', '11999887766', 'senha111', '45678901234', 'Fisica', '2000-12-10', 'Rua Verde, 202, Belo Horizonte, MG'),
('Consultoria Beta', 'consultoria.beta', 'contato@beta.com', '11988776655', 'senha222', '87654321000177', 'Juridica', NULL, 'Avenida Central, 300, Salvador, BA')
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

INSERT INTO SensorTemperatura (localizacao, dtLeitura, temperatura_atual)
VALUES 
    ('Sala 1', '2024-09-01 08:00:00', 22.50),
    ('Sala 2', '2024-09-01 08:05:00', 24.30),
    ('Sala 3', '2024-09-01 08:10:00', 21.75),
    ('Sala 4', '2024-09-01 08:15:00', 23.10),
    ('Sala 5', '2024-09-01 08:20:00', 22.00),
    ('Sala 6', '2024-09-01 08:25:00', 22.85),
    ('Sala 7', '2024-09-01 08:30:00', 25.00),
    ('Sala 8', '2024-09-01 08:35:00', 26.10),
    ('Sala 9', '2024-09-01 08:40:00', 21.50),
    ('Sala 10', '2024-09-01 08:45:00', 27.00)
;

INSERT INTO SensorUmidade (localizacao, dtLeitura, umidade_atual)
VALUES 
    ('Sala 1', '2024-09-01 08:00:00', 45.00),
    ('Sala 2', '2024-09-01 08:05:00', 50.50),
    ('Sala 3', '2024-09-01 08:10:00', 40.75),
    ('Sala 4', '2024-09-01 08:15:00', 55.10),
    ('Sala 5', '2024-09-01 08:20:00', 42.00),
    ('Sala 6', '2024-09-01 08:25:00', 48.85),
    ('Sala 7', '2024-09-01 08:30:00', 50.00),
    ('Sala 8', '2024-09-01 08:35:00', 43.10),
    ('Sala 9', '2024-09-01 08:40:00', 44.50),
    ('Sala 10', '2024-09-01 08:45:00', 52.00)
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











