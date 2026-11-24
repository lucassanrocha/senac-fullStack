const btnGato = document.querySelector("button");
const imagemGato = document.querySelector("img");

async function buscarGato() {
    try{
        const resposta = await fetch("https://api.thecatapi.com/v1/images/search");
        const dados = await resposta.json()

        imagemGato.src = dados[0].url
        console.log(dados[0].url) 

        if(imagemGato < 1){
            imagemGato.src = 'loading.gif'
        }

    }catch(msgError){
        alert("Erro ao carregar o gato")
        console.error(msgError)
    }
}

btnGato.addEventListener('click', buscarGato);