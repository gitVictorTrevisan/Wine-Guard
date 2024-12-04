var database = require("../database/config");

function buscarAdegasPorEmpresa(empresaId) {

  var instrucaoSql = `
    SELECT 
    a.idAdega,
    a.nome,  
    l.temperatura,
    l.umidade
    FROM Adega AS a
    JOIN Sensores AS s ON a.idAdega = s.fkAdega
    JOIN (
      SELECT 
        fkSensor,
        MAX(idLeitura) AS ultimaLeitura  
      FROM Leitura
      GROUP BY fkSensor
      ) AS ultimas ON s.idSensores = ultimas.fkSensor
    JOIN Leitura AS l ON ultimas.ultimaLeitura = l.idLeitura
    WHERE a.fkCadastro = ${empresaId};`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(empresaId, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_empresa) aquario VALUES (${descricao}, ${empresaId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarAdegasPorEmpresa,
  cadastrar
}
