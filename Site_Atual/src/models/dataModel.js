var database = require("../database/config");

function obterDadosTemperatura(idEmpresa, limiteLinha) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterDadosGrafico()");
    var instrucaoSql = `SELECT valor, DATE_FORMAT(dtMedicao,'%H:%i:%s') as dtMedicao, (SELECT round(avg(valor), 2) FROM captura 
                        WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                                            WHERE idEmpresa = ${idEmpresa} AND sensor.unidadeMedida = '°C' AND idLote = 1 AND dtMedicao = now())) AS MediaTempLote
                        FROM captura JOIN sensor ON idSensor = fkSensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                        WHERE idEmpresa = ${idEmpresa} AND sensor.unidadeMedida = '°C' AND idLote = 1 ORDER BY dtMedicao DESC LIMIT ${limiteLinha};`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterDadosUmidade(idEmpresa, limiteLinha) {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function obterDadosGrafico()");
    var instrucaoSql = `SELECT valor, DATE_FORMAT(dtMedicao,'%H:%i:%s') as dtMedicao, (SELECT round(avg(valor), 2) FROM captura 
                        WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                                            WHERE idEmpresa = ${idEmpresa} AND sensor.unidadeMedida = '%' AND idLote = 1 AND dtMedicao = now())) AS MediaTempLote
                        FROM captura JOIN sensor ON idSensor = fkSensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                        WHERE idEmpresa = ${idEmpresa} AND sensor.unidadeMedida = '%' AND idLote = 1 ORDER BY dtMedicao DESC LIMIT ${limiteLinha};`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    obterDadosTemperatura,
    obterDadosUmidade
}
