var express = require("express");
var router = express.Router();

var kpiController = require("../controllers/kpiController.js");

router.get("/listar", function (req, res) {
    kpiController.listar(req, res);
})

router.get("/exibir", function (req, res) {
    kpiController.exibirParametros(req, res);
})

module.exports = router;