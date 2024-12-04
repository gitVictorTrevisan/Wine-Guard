var temperaturaAtual = document.getElementById("temperatura_atual");
var umidadeAtual = document.getElementById("umidade_atual");

function obterMedidas(idAdega) {
    fetch(`/medidas/tempo-real/${idAdega}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    mostrarTempUmidAtual(resposta);
                    
                });
            } else {
                console.error(`Nenhum dado encontrado para o id ${idAdega} ou erro na API`);
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });       
}

function mostrarTempUmidAtual(resposta) {
    var temp = resposta[0].temperatura;
    var umid = resposta[0].umidade;

    temperaturaAtual.innerHTML = temp + "°C";
    umidadeAtual.innerHTML = umid + "%";
}
