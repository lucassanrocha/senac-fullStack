
// Seleciona os elementos do formulário de recuperação de senha
const formRecupera = document.getElementById('recover-form');
const emailField = document.getElementById('email-field');
const emailInput = document.getElementById('recover-email');
const sendCodeButton = document.getElementById('send-code-button');
const codeEntrySection = document.getElementById('code-entry-section');
const verificationCodeInput = document.getElementById('verification-code');
const newPasswordInput = document.getElementById('login-pass');
const confirmNewPasswordInput = document.getElementById('cadastro-pass-confirm');
const verifyCodeButton = document.getElementById('verify-code-button');
const modalError = document.getElementById('modal-error');
const messageError = document.getElementById('error-message');
const loginInfoText = document.querySelector('.login__info-text');

// Variável que armazena o código gerado para a recuperação da senha
let generateCode = "";

// Função responsável por exibir uma mensagem de erro no modal
function messageErrorDisplay(message) {
   modalError.style.display = "block";
   messageError.textContent = message;
}

// Função para gerar um código aleatório com 6 dígitos
function gererateRandomCode() {
   return Math.floor(100000 + Math.random() * 900000).toString();
}

// Evento do botão: envia o código de recuperação para o e-mail informado
sendCodeButton.addEventListener("click", (event) => {
   // Evita o envio padrão do formulário
   event.preventDefault();

   // Esconde a mensagem de erro anterior
   modalError.style.display = "none";

   // Captura o e-mail digitado pelo usuário
   const emailRecover = emailInput.value;

   // Verifica se o campo de e-mail foi preenchido
   if (!emailRecover) {
      messageErrorDisplay('Digite o e-mail valido!');
      return;
   }

   // Recupera o e-mail cadastrado no localStorage
   const emailCadastrado = localStorage.getItem("email_cadastro");

   // Compara o e-mail informado com o e-mail cadastrado
   if (emailRecover.toLowerCase() === emailCadastrado) {

      // Gera e salva o código no armazenamento local
      generateCode = gererateRandomCode();
      localStorage.setItem('codigoGerado', generateCode);

      // Oculta o campo de e-mail e mostra a área de digitação do código
      codeEntrySection.style.display = 'block';
      emailField.style.display = 'none';
      sendCodeButton.style.display = 'none';

      // Exibe ao usuário o código gerado para fins de demonstração do projeto
      loginInfoText.innerHTML = `Código "enviado" para o e-mail <b>${emailRecover}</b>. O código é: <b>${generateCode}</b>`;
      loginInfoText.style.fontSize = '0.8rem';

   } else {
      // Caso o e-mail esteja incorreto, mostra mensagem genérica de recuperação
      messageErrorDisplay("Se um e-mail com este endereço for encontrado, um código de recuperação será enviado para ele.");
   }
});

// Evento do formulário: valida o código e redefine a senha do usuário
formRecupera.addEventListener('submit', (event) => {
   // Impede o envio automático do formulário
   event.preventDefault();
   modalError.style.display = 'none';

   // Obtém os valores preenchidos pelos campos
   const enteredCode = verificationCodeInput.value;
   const newPassoword = newPasswordInput.value;
   const confirmNewPassword = confirmNewPasswordInput.value;

   // Lê o código gerado armazenado no localStorage
   const codigoGeradoLs = localStorage.getItem('codigoGerado');

   // Valida se todos os campos obrigatórios foram preenchidos
   if (!enteredCode || !newPassoword || !confirmNewPassword) {
      messageErrorDisplay('Por favor, preencha todos os campos: Código de Verificação, Nova Senha e Confirmar Nova Senha.');
      return;
   }

   // Verifica se a nova senha e a confirmação coincidem
   if (newPassoword !== confirmNewPassword) {
      messageErrorDisplay('A senha não são iguais');
      return;
   }

   // Confere se o código informado pelo usuário é o mesmo gerado
   if (codigoGeradoLs === enteredCode) {

      // Salva a nova senha e informa sucesso ao usuário
      localStorage.setItem("password_cadastro", newPassoword);
      messageErrorDisplay("Senha redefinida com sucesso! Você pode fazer login novamente");

      // Remove o código temporário após a redefinição
      localStorage.removeItem("codigoGerado");

      // Redireciona para a página inicial após 3 segundos
      setTimeout(() => {
         window.location.href = "../index.html";
      }, 3000);

   } else {
      // Caso o código esteja incorreto, mostra mensagem de erro
      messageErrorDisplay("Codigo de  ");
   }
});
