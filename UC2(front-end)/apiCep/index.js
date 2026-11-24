// https://viacep.com.br/ws/01001000/json/

function buscarCep() {

    const cep = document.getElementById("cep").value;

    if (!cep) {
        document.getElementById("resultado").innerHTML = `
        <p>Preencher o campo de Busca</p>
   
        `
        return
    }

      document.getElementById("resultado").innerHTML = `
       <img src="loading.gif" alt="">
        `
    setTimeout(() => {
      

        fetch(`https://viacep.com.br/ws/${cep}/json/`)
            .then(resposta => resposta.json())
            .then(dados => {
    
                document.getElementById("resultado").innerHTML = `
            <p> ${dados.logradouro}</p>
            <p> Bairro: ${dados.bairro}</p>
            <p> Cidade: ${dados.localidade}</p>
            <p> Estado:  ${dados.estado}</p>
            <p> Regiao:  ${dados.regiao}</p>
            `
            })
    }, 2000);

}