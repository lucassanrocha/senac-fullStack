
const formLogin = document.getElementById('login-form')
let tentativas = 0

formLogin.addEventListener('submit', (event)=> {
    event.preventDefault()
    // variavel do HTML
    const emailLogin = document.getElementById('login-email').value.toLowerCase()
    const passwordLogin = document.getElementById('login-pass').value

    // variavel do LOCALSTORAGE
    const emailLocal = localStorage.getItem('email_cadastro')
    const passwordLocal = localStorage.getItem('password_cadastro')


    if ((emailLogin === emailLocal) && (passwordLogin === passwordLocal)){
        alert('Login efetuado')
        window.location = 'pages/telaLogada.html'
    }else{
        tentativas++
        alert('Login incorreto')

        alert(`Tentativa ${tentativas}/3 `)
        if(tentativas === 3){
            alert("Bloqueado")
            window.location = 'pages/recupera.html'
        }
    }
    
})