function obterdados(idAdega) {
    fetch(`/medidas/tempo-real/${idAdega}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, idAdega);
                });
            } else {
                console.error(`Nenhum dado encontrado para o id ${idAdega} ou erro na API`);
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });

}

function alertar(resposta, idAdega) {
    var temp = resposta[0].temperatura;

    var limites = {
        muito_quente: 23,
        quente: 22,
        ideal: 20,
        frio: 10,
        muito_frio: 5
    };

    var classe_temperatura = 'ideal';

    if (temp >= limites.muito_quente) {
        classe_temperatura = 'perigo-quente';
    }
    else if (temp < limites.muito_quente && temp >= limites.quente) {
        classe_temperatura = 'alerta-quente';
    }
    else if (temp < limites.quente && temp > limites.frio) {
        classe_temperatura = 'ideal';
    }
    else if (temp <= limites.frio && temp > limites.muito_frio) {
        classe_temperatura = 'alerta-frio';
    }
    else if (temp <= limites.muito_frio) {
        classe_temperatura = 'perigo-frio';
    }

    if (document.getElementById(`adega_${idAdega}`)) {
        var card = document.getElementById(`adega_${idAdega}`);
        card.classList.add(classe_temperatura);
    }
}

function atualizacaoPeriodica() {
    JSON.parse(sessionStorage.ADEGAS).forEach(item => {
        obterdados(item.idAdega);
    });
    setTimeout(atualizacaoPeriodica, 5000);
}
