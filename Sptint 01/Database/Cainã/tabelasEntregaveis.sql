CREATE DATABASE sprint_1;
USE sprint_1;

CREATE TABLE dadosTemperaturaUmidade(
	idDia INT PRIMARY KEY AUTO_INCREMENT,
    Dia DATE NOT NULL,
    Hora TIME NOT NULL,
    Temperatura FLOAT NOT NULL,
    Umidade INT NOT NULL
);




drop table dadosTemperaturaUmidade;
INSERT INTO dadosTemperaturaUmidade (Dia, Hora, Temperatura, Umidade ) VALUES
('2024-08-29', '15:30:10', '10.5', '55'),
('2024-08-29', '15:30:22', '12.5', '65'),
('2024-08-30', '16:40:20', '20', '70'),
('2024-08-30', '16:45:22', '18.2', '77'),
('2024-08-31', '18:20:10', '15', '80'),
('2024-08-31', '18:26:17', '13.5', '72');


select*from dadosTemperaturaUmidade;

    
-- Verificar dados a partir do dia 30 de agosto de 2024
SELECT*FROM dadosTemperaturaUmidade
	WHERE Dia >= '2024-08-30';
    
-- O cliente Eduardo Spadasi pediu por XPTO razão que os dados do dia 29
-- fossem apagados, exclua os dados do dia
DELETE FROM dadosTemperaturaUmidade
	WHERE idDia in (1,2);

-- Verificar se os dados foram apagados
SELECT*FROM dadosTEmperaturaUmidade;





CREATE TABLE dadosCadastroUsuarios(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    DiaCadastro DATE,
    NomeCompleto VARCHAR (45),
    Email VARCHAR (50),
    Senha VARCHAR (45)
    );
    drop table dadosCadastroUsuarios;
INSERT INTO dadosCadastroUsuarios (DiaCadastro, NomeCompleto, Email, Senha) VALUES
('2023-07-20','Lucas Quevedo', 'lucasquevedoC@gmail.com', 'senha10'),
('2024-05-10','Rhenan Acquiles', 'rhenanacquiles@gmail.com', 'senha20'),
('2022-04-02','Eduardo Spadasi', 'eduardospadasi@gamil.com', 'senha30'),
('2024-08-25','Gabriel Roz', 'gabrielroz@gamil.com', 'senha40'),
('2021-01-07','Kawe Carmo', 'kawecarmo@gamil.com', 'senha50');


-- Apresentar dados por ordem do dia de cadastro mais novo
SELECT*FROM dadosCadastroUsuarios ORDER BY DiaCadastro DESC;

-- O cliente Kawe Carmo está com irregularidades, ele solicitou uma alteração
-- de senha de cadastro, atualize no banco de dados a senha do cliente 
SELECT*FROM dadosCadastroUsuarios 
	WHERE nomeCompleto = 'Kawe Carmo';
    
UPDATE dadosCadastroUsuarios SET Senha = 'SenhaNova'
	WHERE idUsuario = 5;
    
-- Verificar se a senha atualizou
SELECT*FROM dadosCadastroUsuarios
	WHERE nomeCompleto = 'Kawe Carmo';
    
    
CREATE TABLE dadosSolicitacoesContato(
	idSolicitacao INT PRIMARY KEY AUTO_INCREMENT,
    Nome varchar(45),
    Telefone char (11),
    Email varchar(45)
);

INSERT INTO dadosSolicitacoesContato (Nome, Telefone, Email) VALUES
	('Adriano Rocha', '11912345678', 'rocha@gmail.com'),
    ('Rita Cardoso', '11987654321', 'cardoso@gmail.com'),
    ('Walter Barbosa', '11911223344', 'barbosa@gmail.com'),
    ('Sebastião Mafra', '11910912343', 'mafra@gmail.com'),
    ('Carlos Coelho', '11919837651', 'coelho@gmail.com');
    
SELECT*FROM dadosSolicitacoesContato;

-- O cliente Walter Barbosa desistiu de nos contatar, exclua o registro de contato
	DELETE FROM dadosSolicitacoesContato
		WHERE idSolicitacao = 3;
        
-- Um novo cliente nos mandou uma solicitação 
-- seu nome é Francis Silva, telefone: 11912121212, email: francis@gmail.com
	INSERT INTO dadosSolicitacoesContato (Nome, Telefone, Email)VALUES
		('Francis Silva', '11912121212', 'francis@gmail.com');
    
    
