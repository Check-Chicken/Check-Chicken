var qntdLotes = Number(input_lotesAviario.value)
    var galinhasPorLote = Number(input_galinhasPorLote.value)
    var precoGalinha = Number(input_precoGalinha.value)
    var taxaMortalidadeMensal = Number(input_taxaMortalidadeMensal.value) / 100
    var custoProducao = Number(input_custoProducao.value)
    var custosAdicionais = Number(input_custosAdicionais.value)
    // Dados relativos a seu aviário:
    var galinhasAviario = qntdLotes * galinhasPorLote // Qntd de galinhas por Lote
    var valorAviario = galinhasAviario * precoGalinha // Valor total do aviário
    // Cálculo de mortalidade:
    var taxaMortalidadeDiaria = taxaMortalidadeMensal / 30
    var galinhasPerdidasDia = galinhasPorLote * taxaMortalidadeDiaria// Galinhas mortas diariamente
    var galinhasPerdidasMes = galinhasPerdidasDia * 30// Galinhas mortas mensalmente
    if(galinhasPerdidasDia <= 1){
        galinhasPerdidasDia = '<b>Aproximadamente 1</b>'
    } else {
        galinhasPerdidasDia = galinhasPerdidasDia.toFixed(2)
    }
    //Cálculos com prejuízo:
    var gastoProducaoA = galinhasPerdidasMes * custoProducao // Valor gasto com insumos que foram disperdiçados mensalmente
    var receitaDiariaA = galinhasPorLote * (1 - taxaMortalidadeDiaria) * qntdLotes * precoGalinha // Receita diária com a perda de galinhas 
    var receitaMensalA = receitaDiariaA * 30  // Receita mensal com a perda de galinhas 
    var receitaAnualA = receitaMensalA * 12  // Receita anual com a perda de galinhas 
    var lucroMensalA = receitaMensalA - (gastoProducaoA + custosAdicionais) // Lucro mensal baseado na quantidade de lotes vendidos e a produção perdida
    var lucroAnualA = (lucroMensalA/4) * 12  // Lucro anual considerando uma margem de valor reduzida por 4 (Devido o problema)

    //Cálculos sem prejuízo:
    var receitaDiariaB = galinhasPorLote * (1 - taxaMortalidadeDiaria/2) * qntdLotes * precoGalinha // Receita diária com a nossa solução
    var receitaMensalB = receitaDiariaB * 30   // Receita mensal com a nossa solução
    var receitaAnualB = receitaMensalB * 12   // Receita anual com a nossa solução
    var lucroMensalB = receitaMensalB - custosAdicionais/2  // Lucro mensal baseado na quantidade de lotes vendidos e a diferença pela metade dos custos adicionais
    var lucroAnualB = (lucroMensalB / 2) * 12     // Lucro anual considerando uma margem de valor reduzida somente em 2 (Devida a solução)
  

function aparecerResultado() {
    
  textoExibido.innerHTML += `<h3> Resultados: </h3>
  O valor total do seu aviário, referente a qualidade da sua produção e a quantidade produzida, é de <b>R$${valorAviario}</b>, contendo
<b>${galinhasAviario}</b> galinhas no total.
<br>
<br>
  Com uma taxa de <b>${input_taxaMortalidadeMensal.value * 2.5}%</b> de mortalidade anual e <b>${((input_taxaMortalidadeMensal.value))}%</b> mensal, os seus lotes perdem até:
  <br>
  <b>${galinhasPerdidasDia}</b> Galinhas (diariamente) 
  <br><b>${galinhasPerdidasMes.toFixed(2)}</b> Galinhas (mensalmente)
  <br>
  <br>
  O que te leva a gerar as seguintes receitas: 
  <br>
  <b>R$${receitaDiariaA.toFixed(2)}</b> diariamente <br>
  <b>R$${receitaMensalA.toFixed(2)}</b> mensalmente <br>
  <b>R$${receitaAnualA.toFixed(2)}</b> anualmente 
  <br>
  <br>
  E um lucro de: <br>
  <b>R$${lucroMensalA.toFixed(2)}</b>  mensais<br>
  <b>R$${lucroAnualA.toFixed(2)}</b> anual`
}
