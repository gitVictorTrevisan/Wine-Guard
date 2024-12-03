var kpiModel = require("../models/kpiModel");

function listar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    console.log('AAAAAAAAAAAAAAAAAAAAAAAAAA')
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    kpiModel.listar()
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao listar os dados! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function exibirParametros(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    console.log('AAAAAAAAAAAAAAAAAAAAAAAAAA')
    // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
    kpiModel.exibirParametros()
        .then(
            function (resultado) {
                res.json(resultado);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao exibirParametros os dados! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    listar,
    exibirParametros
}