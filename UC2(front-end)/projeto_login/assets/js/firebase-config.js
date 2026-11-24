
const firebaseConfig = {
    apiKey: "AIzaSyB4m4xrSVjokWwD2yAsPsdc7e5bXIj03PI",
    authDomain: "projetologin-57bf5.firebaseapp.com",
    projectId: "projetologin-57bf5",
    storageBucket: "projetologin-57bf5.firebasestorage.app",
    messagingSenderId: "777413592148",
    appId: "1:777413592148:web:8ec286a929f1db831899c1",
    measurementId: "G-ZGQPR702HH"
};

// Initialize Firebase
firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
const googleProvider = new firebase.auth.GoogleAuthProvider();

const googleLoginButton = document.getElementById("google-login");

googleLoginButton.addEventListener('click', () => {
    auth.signInWithPopup(googleProvider)
    .then((result) => {
        const user = result.user;
        localStorage.setItem("usuario_google", JSON.stringify({ nome: user.displayName, email: user.email }));
        alert(`Bem vindo, ${user.displayName}`);
        window.location = "pages/telaLogada.html";
    })
    .catch((error) => alert(`Erro ao entrar com o Google: ${error.message}`));
});