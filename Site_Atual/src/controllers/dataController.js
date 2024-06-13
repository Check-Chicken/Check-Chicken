var dataModel = require("../models/dataModel");

function obterDadosGrafico(req, res) {
    idEmpresa = req.params.idEmpresa

    dataModel.obterDadosTemperatura(idEmpresa)
        .then(function (resultado1) {

            dataModel.obterDadosUmidade(idEmpresa)
                .then(function (resultado) {
                    let temperatura = resultado1[0].mediaTemperatura
                    let umidade = resultado[0].mediaUmidade

                    console.log(temperatura, umidade)

                    if (resultado.length > 0) {
                        res.status(200).json({
                            umidade: umidade,
                            temperatura: temperatura
                        });
                    } else {
                        res.status(204).send("Nenhum resultado encontrado!")
                    }
                }).catch(function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                });

        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar os avisos: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}



module.exports = {
    obterDadosGrafico
}