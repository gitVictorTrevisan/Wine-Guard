USE WineGuard;

CREATE TABLE Cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cnpj CHAR(18) UNIQUE,
email VARCHAR(45),
telefone CHAR(14)
);

CREATE TABLE Cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
login VARCHAR(45) UNIQUE,
senha VARCHAR(45),
fkCliente INT
);

CREATE TABLE Adega(
idAdega INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
qtdBarricas CHAR(4),
fkCliente INT
);

CREATE TABLE Endereco(
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
cep CHAR(8),
numero VARCHAR(45),
rua VARCHAR(45),
cidade VARCHAR(45),
estado VARCHAR(45),
fkAdega INT
);

CREATE TABLE Sensores(
idSensores INT PRIMARY KEY AUTO_INCREMENT,
localizacao CHAR(3),
statusSensor VARCHAR(45)
CONSTRAINT chkStatus CHECK (statusSensor in('Operante','Inoperante')),
fkAdega INT
);

CREATE TABLE Leitura(
idLeitura INT PRIMARY KEY AUTO_INCREMENT,
temperatura FLOAT(7,2),
umidade CHAR(4),
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
fkSensor INT
);

CREATE TABLE Parametros(
idParametros INT AUTO_INCREMENT,
fkSensor INT,
fkLeitura INT,
tempMin FLOAT(7,2),
tempMAX FLOAT(7,2),
umidadeMin CHAR(4),
umidadeMax CHAR(4),
PRIMARY KEY (idparametros, fkSensor, fkLeitura)
);


CREATE TABLE Alerta(
idAlerta INT PRIMARY KEY AUTO_INCREMENT,
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP,
umidade CHAR(4),
temperatura FLOAT(7,2),
mensagem VARCHAR(150),
fkParametro INT
);


ALTER TABLE Endereco ADD CONSTRAINT fkAdegaEndereco
FOREIGN KEY (fkAdega) REFERENCES Adega(idAdega); 

ALTER TABLE Cadastro ADD CONSTRAINT fkClienteCasdastro
FOREIGN KEY (fkCliente) REFERENCES Cliente(idCliente);

ALTER TABLE Adega ADD CONSTRAINT fkClienteAdega
FOREIGN KEY (fkCliente) REFERENCES Cliente(idCliente);

ALTER TABLE Sensores ADD CONSTRAINT fkAdegaSensores
FOREIGN KEY (fkAdega) REFERENCES Adega(idAdega);

ALTER TABLE Leitura ADD CONSTRAINT fkSensoresLeitura
FOREIGN KEY (fkSensor) REFERENCES Sensores(idSensores);

ALTER TABLE Parametros ADD CONSTRAINT fkSensoresParametros
FOREIGN KEY (fkSensor) REFERENCES Sensores(idSensores);

ALTER TABLE Parametros ADD CONSTRAINT fkLeituraParametros
FOREIGN KEY (fkLeitura) REFERENCES Leitura(idLeitura);

ALTER TABLE Alerta ADD CONSTRAINT fkParametrosAlerta
FOREIGN KEY (fkParametro) REFERENCES Parametros(idParametros);



INSERT INTO Cliente (nome, cnpj, email, telefone) VALUES 
('Vinícola Bela Vista', '67.890.123/0001-45', 'contato@vinicolabelavista.com', '(31)7788-9900'),
('Adega do Vale', '78.901.234/0001-56', 'contato@adegadovale.com', '(41)8899-0011'),
('Quinta dos Vinhedos', '89.012.345/0001-67', 'info@quintadosvinhedos.com', '(51)9900-1122'),
('Vinhos Encanto', '90.123.456/0001-78', 'sac@vinhosencanto.com', '(61)0011-2233'),
('Casa das Uvas', '12.234.567/0001-89', 'contato@casadasuvas.com', '(21)2233-3344');

INSERT INTO Cadastro (login, senha, fkCliente) VALUES 
('vinicolabelavista', 'V!niC0l@2024#', 1),
('adegadovale', 'Ad3g@D0V@l3*', 2),
('quintadosvinhedos', 'Qu!nt@D0sV!nh3d0s#', 3),
('vinhosencanto', 'V!nh0sEnc@nt0$123', 4),
('casadasuvas', 'C@s@D@sUv@s!456', 5);

INSERT INTO Adega (nome, qtdBarricas, fkCliente) VALUES 
('Adega Bela Vista', 150, 1),
('Adega do Vale', 200, 2),
('Quinta dos Vinhedos', 300, 3),
('Vinhos Encanto', 180, 4),
('Casa das Uvas', 250, 5);

INSERT INTO Endereco (cep, numero, rua, cidade, estado, fkAdega) VALUES 
('12345000', 101, 'Rua das Vinhas', 'Bento Gonçalves', 'RS', 1),
('23456000', 202, 'Avenida do Vale', 'Caxias do Sul', 'RS', 2),
('34567000', 303, 'Estrada dos Vinhedos', 'Garibaldi', 'RS', 3),
('45678000', 404, 'Rua Encantada', 'Serra Negra', 'SP', 4),
('56789000', 505, 'Travessa das Uvas', 'Flores da Cunha', 'RS', 5);


INSERT INTO Sensores (fkAdega, localizacao, statusSensor) VALUES
(1, 'A1','Operante'),
(2, 'A1','Operante'),
(3, 'A1','Operante'),
(4, 'A1','Inoperante'),
(4, 'A2','Operante'),
(5, 'A1','Operante');


INSERT INTO Leitura (temperatura, umidade, fkSensor) VALUES
('25.80','60',1),
('25.80','61',1),
('24.70','62',1),
('25.80','61',1),
('25.80','63',1),
('25.80','64',1),
('25.80','60',2),
('25.80','61',2),
('24.70','62',2),
('25.80','61',2),
('25.80','63',2),
('25.80','64',2),
('25.80','60',3),
('25.80','61',3),
('24.70','62',3),
('25.80','61',3),
('25.80','63',3),
('25.80','64',3),
('25.80','60',5),
('25.80','61',5),
('24.70','62',5),
('25.80','61',5),
('25.80','63',5),
('25.80','64',5),
('25.80','60',6),
('25.80','61',6),
('24.70','62',6),
('25.80','61',6),
('25.80','63',6),
('25.80','64',6);

 
INSERT INTO Parametros (fkSensor, tempMin, tempMax, umidadeMin, umidadeMax) VALUES 
(1, 12.0, 16.0, 60, 70),
(2, 11.5, 15.5, 65, 75),
(3, 13.0, 17.0, 58, 72),
(5, 12.5, 16.5, 62, 68),
(6, 11.0, 14.5, 63, 73);



INSERT INTO Alerta (umidade, temperatura, mensagem) VALUES
(90, 18.5, 'Alerta: Alta umidade e temperatura estável. Verificar ventilação.'),
(30, 20.0, 'Alerta: Baixa umidade, atenção para possíveis rachaduras na madeira.'),
(75, 25.0, 'Alerta: Umidade e temperatura elevadas. Risco de aceleração de maturação.'),
(50, 22.0, 'Condições ideais de umidade e temperatura.'),
(85, 19.5, 'Alerta: Alta umidade, monitorar a condensação.'),
(40, 17.0, 'Alerta: Baixa umidade e baixa temperatura. Risco de ressecamento.'),
(65, 24.0, 'Condições estáveis, porém, aumentar a umidade para o ideal.'),
(92, 26.5, 'Alerta: Umidade e temperatura muito altas. Risco de mofo.'),
(55, 21.0, 'Condições normais. Manter os parâmetros atuais.'),
(33, 15.0, 'Alerta: Umidade muito baixa. Risco de desidratação dos produtos.');


UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 1;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 2;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 3;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 4;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 5;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 6;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 7;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 8;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 9;
UPDATE Alerta SET fkParametro = 1
WHERE idAlerta = 10;


SELECT * FROM Leitura ORDER BY dataHora DESC;

SELECT * FROM Alerta;

SELECT s.statusSensor AS 'Status', l.temperatura AS Temperatura, l.umidade AS Umidade, l.dataHora AS 'Data e Hora', a.nome AS Adega
FROM Sensores AS s
JOIN Leitura AS l
ON idSensores = fkSensor
JOIN Adega AS a
ON fkAdega = idAdega;

SELECT l.temperatura, l.umidade, l.dataHora, a.fkCliente
FROM Sensores
JOIN Leitura AS l
ON idSensores = fkSensor
JOIN Adega AS a
ON fkAdega = idAdega
WHERE dataHora = '2024-11-20' AND fkCliente = 1;

USE WineGuard;
SHOW TABLES;