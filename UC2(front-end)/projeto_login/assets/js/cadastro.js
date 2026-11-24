//GUARDA O FORMULARIO 

const formCadastro = document.getElementById("login-form")

formCadastro.addEventListener('submit', (event) => {
    event.preventDefault()
    const emailCadastro = document.getElementById('cadastro-email').value.toLowerCase();
    const passwordCadatro = document.getElementById('cadastro-password').value;
    const passwordCadatroConfimacao = document.getElementById('cadastro-password-confirm').value;

    if(passwordCadatro === passwordCadatroConfimacao){
        localStorage.setItem('email_cadastro', emailCadastro)
        localStorage.setItem('password_cadastro', passwordCadatro)
        window.location.href = '../index.html'
        alert('CADASTRO REALISADO')

    } else{
        alert('SENHAS DIFERENTES')
    }
   
});

