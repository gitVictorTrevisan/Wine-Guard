var database = require("../database/config");

function buscarUltimasMedidas(idSensores, limite_linhas) {

    var instrucaoSql = `SELECT 
        temperatura, umidade,
            DATE_FORMAT(dataHora,'%H:%i') as 'Hora'
            FROM Leitura
            WHERE fkSensor = ${idSensores}
            ORDER BY idLeitura DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {

    var instrucaoSql = `SELECT 
        dht11_temperatura as temperatura, 
        dht11_umidade as umidade,
                        DATE_FORMAT(momento,'%H:%i:%s') as momento_grafico, 
                        fk_aquario 
                        FROM medida WHERE fk_aquario = ${idAquario} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
