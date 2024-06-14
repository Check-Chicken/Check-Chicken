var express = require("express");
var router = express.Router();

var dataController = require("../controllers/dataController");

router.get("/grafico/:idEmpresa", function (req, res) {
    dataController.obterDadosGrafico(req, res);
});

router.get("/tempoReal/:idEmpresa", function (req, res) {
    dataController.obterDadosGraficoTempoReal(req, res);
});

router.get("/kpi/:idEmpresa", function (req, res) {
    dataController.obterKpis(req, res);
});

module.exports = router;