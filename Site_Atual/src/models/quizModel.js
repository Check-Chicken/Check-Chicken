var database = require("../database/config");

function registrarPontos(qtdPontos, usuario) {
    console.log("ACESSEI O MEDIDA MODEL para registrar os pontos do Quiz", qtdPontos);

    var instrucao = `   
        INSERT INTO pontuacao (qtdPontos, fkUsuario) VALUES (${qtdPontos}, ${usuario});
        `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// function registrarAssociativa(idUsuario, idPontuacao) {

//     var instrucao = `   
//         INSERT INTO quiz (fkUsuario, fkPontuacao, dataRealizado) VALUES (${idUsuario}, ${idPontuacao}, now());
//         `;

//     console.log("Executando a instrução SQL: \n" + instrucao);
//     return database.executar(instrucao);
// }



module.exports = {
    registrarPontos
}