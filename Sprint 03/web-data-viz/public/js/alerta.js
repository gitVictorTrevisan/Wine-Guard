var notificacoes = document.getElementById("notificacoes_lista");
var span_notificacoes = document.getElementById("qtd_notificacoes");
var temperaturaAtual = document.getElementById("temperatura_atual");
var umidadeAtual = document.getElementById("umidade_atual");

var qtdNotificacoes = 0;

var temperatura = 0;
var umidade = 0;

function obterdados(idAdega) {
    fetch(`/medidas/tempo-real/${idAdega}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {

                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    alertar(resposta, idAdega);
                    temperatura = resposta[0].temperatura;
                    umidade = resposta[0].umidade;
                    
                });
            } else {
                console.error(`Nenhum dado encontrado para o id ${idAdega} ou erro na API`);
            }
        })
        .catch(function (error) {
            console.error(`Erro na obtenção dos dados do aquario p/ gráfico: ${error.message}`);
        });       
}

var limites = {
    temp_min: 0,
    temp_max: 0,
    ideal: 0,
    umid_min: 0,
    umid_max: 0,
};


function obterParametros(idAdega) {
    fetch(`/medidas/parametros/${idAdega}`)
        .then(resposta => {
            if (resposta.status == 200) {
                resposta.json().then(resposta => {
                    console.log(`Dados recebidos: ${JSON.stringify(resposta)}`);

                    limites.temp_min = resposta[0].tempMax;
                    limites.temp_max = resposta[0].tempMin;
                    limites.umid_min = resposta[0].umidadeMin;
                    limites.umid_max = resposta[0].umidadeMax;

                    console.log(limites);

                    obterdados(idAdega);
                    mostrarParametroIdeal(); 
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
    var umid = resposta[0].umidade;

    var classe_temperatura = 'ideal';

    if (temp >= limites.temp_max + 5 || umid >= limites.umid_max + 6) {
        classe_temperatura = 'perigo-quente';
        notificacoes.innerHTML += 
        `<li>
            <p style="color: #000">
            - Alerta de <span style="color: crimson">Temperatura: (${temp}°C)</span> <br> <span>${resposta[0]['Hora']}</span></p>
        </li>`;
    }
    else if (temp >= limites.temp_max + 4 || umid >= limites.umid_max + 5) {
        classe_temperatura = 'alerta-quente';
        notificacoes.innerHTML += 
        `<li>
            <p style="color: #000">
            - Alerta de <span style="color: crimson">Temperatura: (${temp}°C)</span> <br> <span>${resposta[0]['Hora']}</span></p>
        </li>`;
        qtdNotificacoes++;
    }
    else if ((temp < limites.temp_max && temp > limites.temp_min) && (umid < limites.umid_max && umid > limites.umid_min)) {
        classe_temperatura = 'ideal';
    }
    else if (umid < limites.umid_min - 5) {
        classe_temperatura = 'alerta-frio';
        notificacoes.innerHTML += 
        `<li>
            <p style="color: #000">
            - Alerta de <span style="color: crimson">Temperatura: (${temp}°C)</span> <br> <span>${resposta[0]['Hora']}</span></p>
        </li>`;
        qtdNotificacoes++;
    }
    else if (umid < limites.umid_min - 6) {
        classe_temperatura = 'perigo-frio';
        notificacoes.innerHTML += 
        `<li>
            <p style="color: #000">
            Alerta de <span style="color: crimson">Temperatura: (${temp}°C)</span> <br> <span>${resposta[0]['Hora']}</span></p>
        </li>`;
        qtdNotificacoes++;
    }

    if (document.getElementById(`adega_${idAdega}`)) {
        var card = document.getElementById(`adega_${idAdega}`);
        card.classList.add(classe_temperatura);
    }
    
}

function atualizacaoPeriodica() {
    JSON.parse(sessionStorage.ADEGAS).forEach(item => {
        obterParametros(item.idAdega);
        span_notificacoes.innerHTML = qtdNotificacoes;
    });
    setTimeout(atualizacaoPeriodica, 10000);
}

function mostrarParametroIdeal() {
    var parametro_temperatura = document.getElementById("parametro_temperatura");
    var parametro_umidade = document.getElementById("parametro_umidade");

    parametro_temperatura.innerHTML = `${limites.temp_min} - ${limites.temp_max}`;
    parametro_umidade.innerHTML = `${limites.umid_min} - ${limites.umid_max}`;
}
