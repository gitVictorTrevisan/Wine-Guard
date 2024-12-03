var database = require("../database/config");

function buscarUltimasMedidas(idAdega, limite_linhas) {

    var instrucaoSql = `SELECT 
        temperatura, umidade,
            DATE_FORMAT(dataHora,'%H:%i') as 'Hora'
            FROM Leitura
            WHERE fkSensor = ${idAdega}
            ORDER BY idLeitura DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAdega) {

    var instrucaoSql = `SELECT 
        temperatura, umidade,
                DATE_FORMAT(dataHora,'%H:%i:%s') as 'Hora' 
                FROM Leitura
                WHERE fkSensor = ${idAdega} 
                ORDER BY idLeitura DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarParametros(idAdega) {
    var instrucaoSql = `SELECT
        tempMin, tempMax, umidadeMin, umidadeMax
        FROM Parametros
        WHERE fkSensor = ${idAdega}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal,
    buscarParametros
}
