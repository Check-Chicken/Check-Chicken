var dataModel = require("../models/dataModel");

function obterDadosGrafico(req, res) {
    idEmpresa = req.params.idEmpresa
    let limiteLinha = 12

    dataModel.obterDadosTemperatura(idEmpresa, limiteLinha)
        .then(function (resultado1) {

            dataModel.obterDadosUmidade(idEmpresa, limiteLinha)
                .then(function (resultado) {

                    let umidade = resultado
                    let temperatura = resultado1

                    console.log(temperatura, umidade)

                    if (resultado.length > 0) {
                        res.status(200).json({
                            resultado: resultado,
                            resultado1: resultado1
                        });
                    } else {
                        res.status(204).send("Nenhum resultado encontrado!")
                    }
                }).catch(function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                });

        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar os dados: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function obterDadosGraficoTempoReal() {
    idEmpresa = req.params.idEmpresa

    dataModel.obterDadosTemperaturaTempoReal(idEmpresa, limiteLinha)
        .then(function (resultado1) {

            dataModel.obterDadosUmidadeTempoReal(idEmpresa, limiteLinha)
                .then(function (resultado) {

                    let umidade = resultado
                    let temperatura = resultado1

                    console.log(temperatura, umidade)

                    if (resultado.length > 0) {
                        res.status(200).json({
                            resultado: resultado,
                            resultado1: resultado1
                        });
                    } else {
                        res.status(204).send("Nenhum resultado encontrado!")
                    }
                }).catch(function (erro) {
                    console.log(erro);
                    console.log("Houve um erro ao buscar os dados em tempo real: ", erro.sqlMessage);
                    res.status(500).json(erro.sqlMessage);
                });

        }).catch(function (erro) {
            console.log(erro);
            console.log("Houve um erro ao buscar os dados em tempo real: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}



module.exports = {
    obterDadosGrafico,
    obterDadosGraficoTempoReal
}