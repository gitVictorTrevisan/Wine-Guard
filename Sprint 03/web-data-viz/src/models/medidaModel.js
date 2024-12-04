var database = require("../database/config");

function buscarUltimasMedidas(idAdega, periodo, limite_linhas) {

    var filtroTempo = "";

    if (periodo == 1) {
        filtroTempo = `DATE(dataHora) = CURDATE()`;
    } else if (periodo == 2) {
        filtroTempo = `YEARWEEK(dataHora, 1) = YEARWEEK(CURDATE(), 1)`;
    } else if (periodo == 3) {
        filtroTempo = `MONTH(dataHora) = MONTH(CURDATE()) AND YEAR(dataHora) = YEAR(CURDATE())`;
    }

    var instrucaoSql = `SELECT 
        temperatura, umidade,
            DATE_FORMAT(dataHora,'%H:%i') as 'Hora'
            FROM Leitura
            WHERE fkSensor = ${idAdega} AND ${filtroTempo}
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
