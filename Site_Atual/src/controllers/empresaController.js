var empresaModel = require("../models/empresaModel");

function buscarPorEmpresa(req, res) {
  var nome = req.query.nome;

  empresaModel.buscarPorEmpresa(nome).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

function buscarPorId(req, res) {
  var id = req.params.idEmpresa;

  empresaModel.buscarPorId(idEmpresa).then((resultado) => {
    res.status(200).json(resultado);
  });
}

module.exports = {
  buscarPorEmpresa,
  buscarPorId,
  listar
};
