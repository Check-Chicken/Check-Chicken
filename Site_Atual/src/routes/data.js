var express = require("express");
var router = express.Router();

var dataController = require("../controllers/dataController");

router.get("/grafico/:idEmpresa", function (req, res) {
    dataController.obterDadosGrafico(req, res);
});

// router.get("/grafico/tempoReal/${idEmpresa}", function (req, res) {
//     dataController.obterDadosGrafico(req, res);
// });

module.exports = router;