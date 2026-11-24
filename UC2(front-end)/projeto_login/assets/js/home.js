const botaoSair = document.getElementById('login-button-home');
const paragrafo = document.getElementById('text-login')

const nomeUsuario = JSON.parse(localStorage.getItem("usuario_google"))
paragrafo.textContent = `Seja Bem-Vindo ${nomeUsuario.nome}`




botaoSair.addEventListener('click', (event) => {
    event.preventDefault()
    alert('Você saiu da página');
    window.location.href = '../index.html';

});