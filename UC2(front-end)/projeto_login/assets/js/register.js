function showHidePassword(inputId, iconId) {
    const input = document.getElementById(inputId);
    const iconEye = document.getElementById(iconId);

    if (!input || !iconEye) {
        console.warn(`Elemento não encontrado: ${inputId} / ${iconId}`);
        return;
    }

    iconEye.addEventListener("click", () => {
        const isPassword = input.type === "password";

        input.type = isPassword ? "text" : "password";
        iconEye.classList.toggle("ri-eye-line", isPassword);
        iconEye.classList.toggle("ri-eye-off-line", !isPassword);
    });
}

showHidePassword("login-pass", "login-eye");
showHidePassword("cadastro-password", "login-eye-cadastro");
showHidePassword("cadastro-pass-confirm", "login-eye-confirm");