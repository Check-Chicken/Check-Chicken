var empresaModel = require("../models/empresaModel");

function buscarPorCnpj(req, res) {
  var cnpj = req.query.cnpj;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

function buscarPorId(req, res) {
  var id = req.params.id;

  empresaModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function cadastrarEmpresa(req, res) {
  var nome = req.body.nomeServer;
  var cnpj = req.body.cnpjServer;
  var ddd = req.body.dddServer; 
  var prefixo = req.body.prefixoServer;
  var sufixo = req.body.sufixoServer;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    if (resultado.length > 0) {
      res
        .status(401)
        .json({ mensagem: `a empresa com o cnpj ${cnpj} já existe` });
    } else {
      empresaModel.cadastrarEmpresa(nome, cnpj, ddd, prefixo, sufixo).then((resultado) => {
        res.status(201).json(resultado);
      });
    }
  });
}

function cadastrarEndereco(req, res) {
  var cep = req.body.cepServer;
  var complemento = req.body.complementoServer;
  var numero = req.body.numeroServer 
  

      empresaModel.cadastrarEndereco(cep, complemento, numero, ).then((resultado) => {
        res.status(201).json(resultado);
  });
}

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  cadastrarEmpresa,
  cadastrarEndereco,
  listar,
};
