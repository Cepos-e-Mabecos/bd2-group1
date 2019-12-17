document.querySelector("[data-trigger]").addEventListener('click',()=>{
    document.querySelector('#main_nav').classList.toggle('show');
    document.querySelector('body').classList.toggle('offcanvas-active');
});

document.querySelector(".btn-close").addEventListener('click',()=>{
    document.querySelector('.navbar-collapse').classList.remove('show');
    document.querySelector('body').classList.remove('offcanvas-active');
});

