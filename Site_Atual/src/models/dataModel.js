var database = require("../database/config");

function obterDadosTemperatura(idEmpresa) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterDadosGrafico()");
    var instrucaoSql = `SELECT round(avg(valor), 2) AS mediaTemperatura FROM captura 
                        WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                                            WHERE idEmpresa = ${idEmpresa} AND sensor.unidadeMedida = '°C' AND idLote = 1 AND dtMedicao = now());`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosUmidade(idEmpresa) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterDadosGrafico()");
    var instrucaoSql = `SELECT round(avg(valor), 2) AS mediaUmidade FROM captura 
                        WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                                            WHERE idEmpresa = ${idEmpresa} AND sensor.unidadeMedida = '%' AND idLote = 1 AND dtMedicao = now());`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    obterDadosTemperatura,
    obterDadosUmidade
}
