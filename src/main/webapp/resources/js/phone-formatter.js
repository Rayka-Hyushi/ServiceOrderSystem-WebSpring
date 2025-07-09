document.addEventListener('DOMContentLoaded', function () {
    const telInputs = document.querySelectorAll('input[data-tipo="telefone"]');
    telInputs.forEach(input => {
        Inputmask({mask: "(99) 99999-9999"}).mask(input);
    });
});