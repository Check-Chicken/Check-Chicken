var perfilModel = require("../models/perfilModel");


function editar(req, res) {
    var novoNome = req.body.novoNome;
    var idUsuario = req.body.idUsuario;

    perfilModel.editar(novoNome, idUsuario)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao editar o perfil: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );

}



module.exports = {
    editar,

}