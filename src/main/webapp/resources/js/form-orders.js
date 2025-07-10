let servicosSelecionados = [];

let listaServicos;
let campoDesconto;
let campoExtras;
let campoTotal;

// Função para renderizar um único serviço na lista (tanto novos quanto iniciais)
function renderizarServicoNaLista(servico) {
    // Garante que listaServicos foi inicializada e existe
    if (!listaServicos) {
        console.error("Elemento 'listaServicos' não encontrado. Não é possível renderizar o serviço.");
        return;
    }

    const item = document.createElement('li');
    // Adiciona um atributo data-id para facilitar a localização do item no DOM
    item.className = 'list-group-item d-flex justify-content-between align-items-center';
    item.setAttribute('data-id', servico.id); // Adiciona data-id ao li
    item.textContent = servico.nome; // Assume que 'nome' já contém 'nome - R$ valor' se desejar

    const btn = document.createElement('button');
    btn.className = 'btn btn-sm btn-danger';
    btn.textContent = 'Remover';
    btn.onclick = () => {
        // Remove o item da lista visual
        if (listaServicos && item.parentNode === listaServicos) {
            listaServicos.removeChild(item);
        }

        // Remove o serviço do array servicosSelecionados
        servicosSelecionados = servicosSelecionados.filter(s => s.id !== servico.id);

        atualizarTotal(); // Recalcula o total
    };

    const inputHidden = document.createElement('input');
    inputHidden.type = 'hidden';
    inputHidden.name = 'servicosIds'; // Nome que o Spring MVC vai esperar
    inputHidden.value = servico.id;

    item.appendChild(inputHidden);
    item.appendChild(btn);
    listaServicos.appendChild(item);
}


// Função para atualizar o total da ordem de serviço
function atualizarTotal() {
    // Garante que os campos de total foram inicializados antes de usá-los
    if (campoTotal && campoDesconto && campoExtras) {
        // Agora usando 'valor' consistentemente
        let totalServicos = servicosSelecionados.reduce((sum, s) => sum + s.valor, 0);
        const desconto = parseFloat(campoDesconto.value || 0);
        const extras = parseFloat(campoExtras.value || 0);

        let novoTotal = totalServicos - desconto + extras;
        campoTotal.value = (novoTotal > 0 ? novoTotal : 0).toFixed(2); // Garante que o total não seja negativo
    } else {
        console.warn("Elementos de cálculo de total não encontrados ao tentar atualizar.");
    }
}

// --- Event Listener Principal (DOMContentLoaded) ---
document.addEventListener('DOMContentLoaded', () => {
    // 1. Inicialize os elementos DOM APENAS depois que o DOM estiver completamente carregado
    listaServicos = document.getElementById('listaServicos');
    campoDesconto = document.getElementById('campoDesconto');
    campoExtras = document.getElementById('campoExtras');
    campoTotal = document.getElementById('campoTotal');

    // 2. Renderize os serviços que já estão em 'servicosSelecionados' (populados pelo JSP)
    // Isso garante que os serviços previamente associados sejam exibidos visualmente.
    servicosSelecionados.forEach(servico => {
        renderizarServicoNaLista(servico);
    });

    // 3. Atualize o total inicial após todos os serviços (iniciais + adicionados) estarem no array
    atualizarTotal();

    // 4. Anexar o event listener para o botão de adicionar serviço
    document.getElementById('btnAdicionarServico')?.addEventListener('click', () => {
        const select = document.getElementById('selectServico');

        if (!select || select.selectedIndex === -1) {
            console.warn("Nenhum serviço selecionado ou elemento 'selectServico' não encontrado.");
            return;
        }

        const option = select.options[select.selectedIndex];
        const idServicoAdicionar = option.value;
        const nomeServicoAdicionar = option.text;
        const valorServicoAdicionar = parseFloat(option.getAttribute('data-valor'));

        if (!idServicoAdicionar || isNaN(valorServicoAdicionar)) {
            console.warn("Serviço selecionado inválido (ID ou Valor ausente/inválido). ID:", idServicoAdicionar, "Valor:", valorServicoAdicionar);
            return;
        }

        // Verifica se o serviço já foi adicionado usando .some() para clareza
        if (!servicosSelecionados.some(s => s.id === idServicoAdicionar)) {
            const novoServico = { id: idServicoAdicionar, nome: nomeServicoAdicionar, valor: valorServicoAdicionar }; // Usando 'valor'
            servicosSelecionados.push(novoServico);

            renderizarServicoNaLista(novoServico); // Reutiliza a função de renderização
            atualizarTotal(); // Recalcula o total
        } else {
            console.warn(`Serviço com ID ${idServicoAdicionar} já está na lista.`);
        }
    });

    // 5. Anexar listeners de input para os campos de desconto e extras
    campoDesconto?.addEventListener('input', atualizarTotal);
    campoExtras?.addEventListener('input', atualizarTotal);
});