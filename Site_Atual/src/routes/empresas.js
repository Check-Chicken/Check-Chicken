var express = require("express");
var router = express.Router();

var empresaController = require("../controllers/empresaController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
// router.post("/cadastrarEmpresa", function (req, res) {
//   empresaController.cadastrarEmpresa(req, res);
// })

// router.post("/cadastrarEndereco", function (req, res) {
//   empresaController.cadastrarEndereco(req, res);
// })

router.get("/buscar", function (req, res) {
    empresaController.buscarPorCnpj(req, res);
});

router.get("/buscar/:idEmpresa", function (req, res) {
  empresaController.buscarPorId(req, res);
});

router.get("/listar", function (req, res) {
  empresaController.listar(req, res);
});

module.exports = router;