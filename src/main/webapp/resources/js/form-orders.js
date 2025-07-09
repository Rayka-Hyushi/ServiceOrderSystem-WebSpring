const listaServicos = document.getElementById('listaServicos');
const campoDesconto = document.getElementById('campoDesconto');
const campoExtras = document.getElementById('campoExtras');
const campoTotal = document.getElementById('campoTotal');

let servicosSelecionados = [];

document.getElementById('btnAdicionarServico')?.addEventListener('click', () => {
    const select = document.getElementById('selectServico');
    const option = select.options[select.selectedIndex];
    const id = option.value;
    const nome = option.text;
    const preco = parseFloat(option.getAttribute('data-preco'));

    if (!servicosSelecionados.find(s => s.id === id)) {
        servicosSelecionados.push({ id, nome, preco });

        const item = document.createElement('li');
        item.className = 'list-group-item d-flex justify-content-between align-items-center';
        item.textContent = nome;

        const btn = document.createElement('button');
        btn.className = 'btn btn-sm btn-danger';
        btn.textContent = 'Remover';
        btn.onclick = () => {
            listaServicos.removeChild(item);
            servicosSelecionados = servicosSelecionados.filter(s => s.id !== id);
            atualizarTotal();
        };

        const inputHidden = document.createElement('input');
        inputHidden.type = 'hidden';
        inputHidden.name = 'servicosIds';
        inputHidden.value = id;
        item.appendChild(inputHidden);
        item.appendChild(btn);
        listaServicos.appendChild(item);
        atualizarTotal();
    }
});

function atualizarTotal() {
    let total = servicosSelecionados.reduce((sum, s) => sum + s.preco, 0);
    const desconto = parseFloat(campoDesconto?.value || 0);
    const extras = parseFloat(campoExtras?.value || 0);
    campoTotal.value = (total - desconto + extras).toFixed(2);
}

campoDesconto?.addEventListener('input', atualizarTotal);
campoExtras?.addEventListener('input', atualizarTotal);