var database = require("../database/config");

function listar() {
    console.log("ACESSEI O AVISO  MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucaoSql = `
    SELECT usuario.*, p.*
    FROM usuario JOIN (
    SELECT fkUsuario, MAX(qtdPontos) AS max_score
    FROM pontuacao as p
    GROUP BY fkUsuario ) 
    pm ON usuario.idUsuario = pm.fkUsuario
    JOIN pontuacao p ON p.fkUsuario = pm.fkUsuario AND p.qtdPontos = pm.max_score
    WHERE p.idPontuacao IN (
    SELECT MIN(pontuacao2.idPontuacao)
    FROM pontuacao as pontuacao2 JOIN (
    SELECT fkUsuario, MAX(qtdPontos) AS max_score
    FROM pontuacao as pontuacao3 GROUP BY fkUsuario
    ) pontuacao3 ON pontuacao2.fkUsuario = pontuacao3.fkUsuario AND pontuacao2.qtdPontos = pontuacao3.max_score
    GROUP BY pontuacao2.fkUsuario
    ) ORDER BY pm.max_score DESC LIMIT 10;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    listar
}
