var database = require("../database/config");

function buscarPorId(idEmpresa) {
  var instrucaoSql = `SELECT * FROM empresa WHERE idEmpresa = '${idEmpresa}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT * FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorEmpresa(nome) {
  var instrucaoSql = `SELECT * FROM empresa WHERE nome = '${nome}'`;

  return database.executar(instrucaoSql);
}


module.exports = { buscarPorEmpresa, buscarPorId, listar };
