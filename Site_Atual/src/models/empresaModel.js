var database = require("../database/config");

function buscarPorId(idEmpresa) {
  var instrucaoSql = `SELECT * FROM empresa WHERE idEmpresa = '${idEmpresa}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT * FROM empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

// function cadastrarEmpresa(nome, cnpj, ddd, prefixo, sufixo) {
//   var instrucaoSql = `INSERT INTO empresa (nome, cnpj, ddd, prefixo, sufixo) VALUES ('${nome}', '${cnpj}', '${ddd}', '${prefixo}', '${sufixo}')`;

//   return database.executar(instrucaoSql);
// }

// function cadastrarEndereco(cep, complemento, numero) {
//   var instrucaoSql = `INSERT INTO endereco (cep, complemento, numero) VALUES ('${cep}', '${complemento}', '${numero}')`;

//   return database.executar(instrucaoSql);
// }

module.exports = { buscarPorCnpj, buscarPorId, listar };
