let btnMenu = document.getElementById('btn-menu');
let menu = document.getElementById('menu-mobile');
let btnFecharMenu = document.querySelector('.btn-fechar');
let overlay = document.querySelector('.overlay-menu');

btnMenu.addEventListener('click', () => {
    menu.classList.add('abrir-menu')
});



btnFecharMenu.addEventListener('click', () => {
    menu.classList.remove('abrir-menu')
});

overlay.addEventListener('click', () => {
    menu.classList.remove('abrir-menu')
})