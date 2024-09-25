CREATE DATABASE sprint01;

USE sprint01;


-- CRIAÇÃO DA TABELA CADASTRO
CREATE TABLE cadastro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(45) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,
    tipo_pessoa VARCHAR(15) NOT NULL,
    CONSTRAINT chk_tipo_pessoa
    CHECK (tipo_pessoa in ('Fisica', 'Juridica')),
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

-- INSERINDO VALORES NA TABELA
INSERT INTO Cadastro (nome_usuario, cpf_cnpj, tipo_pessoa, endereco, telefone) VALUES
('Phineas', '123.456.789-00', 'Fisica', 'Rua Willis Roberto Banks, 401', '1234-5678'),
('São Paulo Tech School', '12.345.678/0001-90', 'Juridica', 'Rua Haddock Lobo, 595', '1111-2222'),
('Thiago Galvão', '987.654.321-00', 'Fisica', 'Rua Lopo Homem, 100', '8765-4321'),
('Garage Truck Center', '98.765.432/0001-01', 'Juridica', 'Avenida dos Remédios, 1300', '3333-4444');

-- CONSULTANDO OS DADOS DA TABELA
SELECT * FROM cadastro;



-- CRIAÇÃO DA TABELA DO SENSOR DE UMIDADE
CREATE TABLE dados_DHT11 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    umidade DECIMAL(5, 2) NOT NULL,
    data_hora DATETIME NOT NULL,
    cadastro_id INT
);

-- INSERINDO VALORES NA TABELA
INSERT INTO dados_DHT11 (umidade, data_hora, cadastro_id) VALUES
(45.00, '2024-09-04 12:00:00', 1),
(50.00, '2024-09-04 13:00:00', 3);

-- CONSULTANDO OS DADOS DA TABELA
SELECT * FROM dados_DHT11;


-- CRIAÇÃO DA TABELA DO SENSOR DE TEMPERATURA
CREATE TABLE dados_LM35 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    temperatura DECIMAL(5, 2) NOT NULL,
    data_hora DATETIME NOT NULL,
    cadastro_id INT
);

-- INSERINDO VALORES NA TABELA
INSERT INTO dados_LM35 (temperatura, data_hora, cadastro_id) VALUES
(22.50, '2024-09-04 12:05:00', 2),
(24.75, '2024-09-04 13:05:00', 4);

-- CONSULTANDO OS DADOS DA TABELA
SELECT * FROM dados_LM35;