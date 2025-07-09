<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page isELIgnored="false" %>--%>
<%--<c:if test="${empty sessionScope.usuario}">--%>
<%--    <c:redirect url="/" />--%>
<%--</c:if>--%>

<%--<html lang="pt-br">--%>
<%--    <head>--%>
<%--        <meta charset="UTF-8">--%>
<%--        <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--        <title>Service Order System</title>--%>
<%--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">--%>
<%--        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">--%>
<%--    </head>--%>
<%--    <body class="bg-dark text-white d-flex align-items-center justify-content-center vh-100">--%>
<%--        <jsp:include page="../components/perfil.jsp" />--%>

<%--        <!-- Modal de Ordens -->--%>
<%--        <div class="modal fade show d-block" id="modalOrdens" tabindex="-1" aria-labelledby="modalOrdensLabel" aria-hidden="true" style="background-color: rgba(0,0,0,0.5);">--%>
<%--            <div class="modal-dialog modal-xl modal-dialog-centered">--%>
<%--                <div class="modal-content rounded-4 shadow-lg">--%>
<%--                    <div class="modal-header bg-primary text-white">--%>
<%--                        <h5 class="modal-title" id="modalOrdensLabel">Gerenciador de Ordens ${modo}</h5>--%>
<%--                        <a href="home" class="btn-close btn-close-white" aria-label="Fechar"></a>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <!-- Botão Nova Ordem -->--%>
<%--                        <div class="mb-3 text-end">--%>
<%--                            <a href="ordens?action=novo" class="btn btn-success">Nova Ordem</a>--%>
<%--                        </div>--%>

<%--                        <!-- Tabela de Ordens -->--%>
<%--                        <table class="table table-bordered table-hover align-middle">--%>
<%--                            <thead class="table-light">--%>
<%--                                <tr>--%>
<%--                                    <th>ID</th>--%>
<%--                                    <th>Cliente</th>--%>
<%--                                    <th>Descrição</th>--%>
<%--                                    <th>Desconto</th>--%>
<%--                                    <th>Extras</th>--%>
<%--                                    <th>Total</th>--%>
<%--                                    <th>Estado</th>--%>
<%--                                    <th>Ações</th>--%>
<%--                                </tr>--%>
<%--                            </thead>--%>
<%--                            <tbody>--%>
<%--                                <c:forEach var="ordem" items="${ordens}">--%>
<%--                                    <tr>--%>
<%--                                        <td>${ordem.osid}</td>--%>
<%--                                        <td>${ordem.cliente.nome}</td>--%>
<%--                                        <td>${ordem.descricao}</td>--%>
<%--                                        <td>${ordem.extras}</td>--%>
<%--                                        <td>${ordem.desconto}</td>--%>
<%--                                        <td>${ordem.total}</td>--%>
<%--                                        <td>${ordem.status}</td>--%>
<%--                                        <td>--%>
<%--                                            <a href="ordens?action=editar&id=${ordem.cliente.idcliente}&osid=${ordem.osid}" class="btn btn-sm btn-warning">Editar</a>--%>
<%--                                            <a href="ordens?action=excluir&id=${ordem.cliente.idcliente}&osid=${ordem.osid}" class="btn btn-sm btn-danger">Excluir</a>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                </c:forEach>--%>
<%--                            </tbody>--%>
<%--                        </table>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Modal Formulário de Ordem de Serviço -->--%>
<%--        <c:if test="${modo == 'novo' || modo == 'editar'}">--%>
<%--            <div class="modal show fade d-block" id="modalFormO" tabindex="-1" style="background-color: rgba(0,0,0,0.5);">--%>
<%--                <div class="modal-dialog modal-lg">--%>
<%--                    <form method="post" class="modal-content bg-white text-dark">--%>
<%--                        <div class="modal-header bg-secondary text-white">--%>
<%--                            <h5 class="modal-title">${modo == 'novo' ? 'Nova Ordem de Serviço' : 'Editar Ordem de Serviço'}</h5>--%>
<%--                            <a href="ordens" class="btn-close btn-close-white"></a>--%>
<%--                        </div>--%>

<%--                        <div class="modal-body">--%>
<%--                            <input type="hidden" name="modo" value="${modo}">--%>
<%--                            <c:if test="${modo == 'editar'}">--%>
<%--                                <input type="hidden" name="osid" value="${ordemEdit.osid}">--%>
<%--                            </c:if>--%>

<%--                            <!-- Cliente -->--%>
<%--                            <div class="mb-3">--%>
<%--                                <label class="form-label">Cliente</label>--%>
<%--                                <select class="form-control" name="idcliente">--%>
<%--                                <c:forEach var="c" items="${clientes}">--%>
<%--                                        <option value="${c.idcliente}"--%>
<%--                                                <c:if test="${not empty ordemEdit && c.idcliente == ordemEdit.cliente.idcliente}">--%>
<%--                                                    selected--%>
<%--                                                </c:if>>--%>
<%--                                                ${c.nome}--%>
<%--                                        </option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                            </div>--%>

<%--                            <!-- Descrição -->--%>
<%--                            <div class="mb-3">--%>
<%--                                <label class="form-label">Descrição</label>--%>
<%--                                <textarea class="form-control" name="descricao" required><c:out value='${ordemEdit.descricao}'/></textarea>--%>
<%--                            </div>--%>

<%--                            <!-- Status -->--%>
<%--                            <c:if test="${modo == 'editar'}">--%>
<%--                                <div class="mb-3">--%>
<%--                                    <label class="form-label">Status</label>--%>
<%--                                    <select name="status" class="form-control">--%>
<%--                                        <option value="Pendente" <c:if test="${ordemEdit.status == 'Pendente'}">selected</c:if>>Pendente</option>--%>
<%--                                        <option value="Finalizado" <c:if test="${ordemEdit.status == 'Finalizado'}">selected</c:if>>Finalizado</option>--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>

<%--                            <!-- Serviços -->--%>
<%--                            <c:if test="${modo == 'editar'}">--%>
<%--                                <div class="mb-3">--%>
<%--                                    <label class="form-label">Serviços</label>--%>
<%--                                    <div class="input-group">--%>
<%--                                        <select id="selectServico" class="form-control">--%>
<%--                                            <c:forEach var="s" items="${servicos}">--%>
<%--                                                <option value="${s.idservico}" data-valor="${s.valor}">${s.nome} - R$ ${s.valor}</option>--%>
<%--                                            </c:forEach>--%>
<%--                                        </select>--%>
<%--                                        <button type="button" class="btn btn-primary" id="btnAdicionarServico">Adicionar</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <ul class="list-group mb-3" id="listaServicos">--%>
<%--                                    <!-- Serviços adicionados aparecerão aqui -->--%>
<%--                                </ul>--%>

<%--                                <div class="mb-3">--%>
<%--                                    <label class="form-label">Desconto</label>--%>
<%--                                    <input type="number" step="0.01" name="desconto" class="form-control" value="${ordemEdit.desconto}" id="campoDesconto">--%>
<%--                                </div>--%>
<%--                                <div class="mb-3">--%>
<%--                                    <label class="form-label">Extras</label>--%>
<%--                                    <input type="number" step="0.01" name="extras" class="form-control" value="${ordemEdit.extras}" id="campoExtras">--%>
<%--                                </div>--%>
<%--                                <div class="mb-3">--%>
<%--                                    <label class="form-label">Total</label>--%>
<%--                                    <input type="number" step="0.01" name="total" class="form-control" id="campoTotal" value="${ordemEdit.total}" readonly>--%>
<%--                                </div>--%>
<%--                            </c:if>--%>
<%--                        </div>--%>

<%--                        <div class="modal-footer">--%>
<%--                            <button class="btn btn-success" type="submit">Salvar</button>--%>
<%--                            <a href="ordens" class="btn btn-secondary">Cancelar</a>--%>
<%--                        </div>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:if>--%>

<%--        <!-- Rodapé -->--%>
<%--        <footer class="position-absolute bottom-0 end-0 p-2 text-white small">--%>
<%--            <p class="mb-0">All Copyrights © Reserved - Created by Sidnei dos Santos</p>--%>
<%--            <p class="mb-0">Graduated in Computer Technician on January 12, 2024.</p>--%>
<%--        </footer>--%>

<%--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>--%>
<%--        <script>--%>
<%--            const servicosSelecionados = [];--%>

<%--            <c:forEach var="s" items="${servicosSelecionados}">--%>
<%--            servicosSelecionados.push({--%>
<%--                id: '${s.idservico}',--%>
<%--                nome: '${s.nome} - R$ ${s.valor}',--%>
<%--                valor: parseFloat('${s.valor}')--%>
<%--            });--%>
<%--            </c:forEach>--%>

<%--            window.addEventListener('DOMContentLoaded', () => {--%>
<%--                const lista = document.getElementById('listaServicos');--%>
<%--                servicosSelecionados.forEach(servico => {--%>
<%--                    const item = document.createElement('li');--%>
<%--                    item.className = 'list-group-item d-flex justify-content-between align-items-center';--%>
<%--                    item.textContent = servico.nome;--%>

<%--                    const btn = document.createElement('button');--%>
<%--                    btn.className = 'btn btn-sm btn-danger';--%>
<%--                    btn.textContent = 'Remover';--%>
<%--                    btn.onclick = () => {--%>
<%--                        lista.removeChild(item);--%>
<%--                        servicosSelecionados.splice(servicosSelecionados.findIndex(s => s.id === servico.id), 1);--%>
<%--                        atualizarTotal();--%>
<%--                    };--%>

<%--                    const inputHidden = document.createElement('input');--%>
<%--                    inputHidden.type = 'hidden';--%>
<%--                    inputHidden.name = 'servicosIds';--%>
<%--                    inputHidden.value = servico.id;--%>
<%--                    item.appendChild(inputHidden);--%>
<%--                    item.appendChild(btn);--%>
<%--                    lista.appendChild(item);--%>
<%--                });--%>

<%--                atualizarTotal();--%>
<%--            });--%>
<%--        </script>--%>
<%--        <script src="${pageContext.request.contextPath}/resources/js/form-orders.js"></script>--%>
<%--    </body>--%>
<%--</html>--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<c:if test="${empty sessionScope.usuario}">
    <c:redirect url="/" />
</c:if>

<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Order System</title>
    <style>
        /* Estilos básicos para legibilidade - pode ser removido se não for necessário */
        body { font-family: sans-serif; margin: 20px; background-color: #333; color: white; }
        .container { max-width: 960px; margin: 0 auto; padding: 20px; border: 1px solid #555; background-color: #444; }
        h1, h5 { color: #ADD8E6; } /* Light Blue */
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #666; padding: 8px; text-align: left; }
        th { background-color: #555; }
        .modal {
            display: none; /* Esconde o modal por padrão */
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.7);
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            color: black;
        }
        .close-button {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close-button:hover,
        .close-button:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .button-group a, .button-group button {
            margin-right: 5px;
            padding: 8px 12px;
            text-decoration: none;
            color: white;
            border: none;
            cursor: pointer;
        }
        .button-group .btn-success { background-color: green; }
        .button-group .btn-warning { background-color: orange; }
        .button-group .btn-danger { background-color: red; }
        .button-group .btn-primary { background-color: blue; }
        .button-group .btn-secondary { background-color: gray; }
        label { display: block; margin-bottom: 5px; margin-top: 10px;}
        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }
        ul { list-style-type: none; padding: 0; }
        li { background-color: #eee; border: 1px solid #ddd; margin-bottom: 5px; padding: 8px; color: black; }
    </style>
</head>
<body>
<jsp:include page="../components/perfil.jsp" />

<div class="modal" id="modalOrdens" style="display: block;"> <div class="modal-content">
    <div class="modal-header">
        <h5>Gerenciador de Ordens ${modo}</h5>
        <a href="home" class="close-button" aria-label="Fechar">&times;</a>
    </div>
    <div class="modal-body">
        <div class="button-group" style="text-align: right; margin-bottom: 15px;">
            <a href="ordens?action=novo" class="btn-success">Nova Ordem</a>
        </div>

        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Cliente</th>
                <th>Descrição</th>
                <th>Desconto</th>
                <th>Extras</th>
                <th>Total</th>
                <th>Estado</th>
                <th>Ações</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ordem" items="${ordens}">
                <tr>
                    <td>${ordem.osid}</td>
                    <td>${ordem.cliente.nome}</td>
                    <td>${ordem.descricao}</td>
                    <td>${ordem.extras}</td>
                    <td>${ordem.desconto}</td>
                    <td>${ordem.total}</td>
                    <td>${ordem.status}</td>
                    <td class="button-group">
                        <a href="ordens?action=editar&id=${ordem.cliente.idcliente}&osid=${ordem.osid}" class="btn-warning">Editar</a>
                        <a href="ordens?action=excluir&id=${ordem.cliente.idcliente}&osid=${ordem.osid}" class="btn-danger">Excluir</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>

<c:if test="${modo == 'novo' || modo == 'editar'}">
    <div class="modal" id="modalFormO" style="display: block;"> <div class="modal-content">
        <form method="post">
            <div class="modal-header">
                <h5>${modo == 'novo' ? 'Nova Ordem de Serviço' : 'Editar Ordem de Serviço'}</h5>
                <a href="ordens" class="close-button">&times;</a>
            </div>

            <div class="modal-body">
                <input type="hidden" name="modo" value="${modo}">
                <c:if test="${modo == 'editar'}">
                    <input type="hidden" name="osid" value="${ordemEdit.osid}">
                </c:if>

                <div>
                    <label>Cliente</label>
                    <select name="idcliente">
                        <c:forEach var="c" items="${clientes}">
                            <option value="${c.idcliente}"
                                    <c:if test="${not empty ordemEdit && c.idcliente == ordemEdit.cliente.idcliente}">
                                        selected
                                    </c:if>>
                                    ${c.nome}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label>Descrição</label>
                    <textarea name="descricao" required><c:out value='${ordemEdit.descricao}'/></textarea>
                </div>

                <c:if test="${modo == 'editar'}">
                    <div>
                        <label>Status</label>
                        <select name="status">
                            <option value="Pendente" <c:if test="${ordemEdit.status == 'Pendente'}">selected</c:if>>Pendente</option>
                            <option value="Finalizado" <c:if test="${ordemEdit.status == 'Finalizado'}">selected</c:if>>Finalizado</option>
                        </select>
                    </div>
                </c:if>

                <c:if test="${modo == 'editar'}">
                    <div>
                        <label>Serviços</label>
                        <div>
                            <select id="selectServico">
                                <c:forEach var="s" items="${servicos}">
                                    <option value="${s.idservico}" data-valor="${s.valor}">${s.nome} - R$ ${s.valor}</option>
                                </c:forEach>
                            </select>
                            <button type="button" id="btnAdicionarServico" class="btn-primary">Adicionar</button>
                        </div>
                    </div>

                    <ul id="listaServicos">
                    </ul>

                    <div>
                        <label>Desconto</label>
                        <input type="number" step="0.01" name="desconto" value="${ordemEdit.desconto}" id="campoDesconto">
                    </div>
                    <div>
                        <label>Extras</label>
                        <input type="number" step="0.01" name="extras" value="${ordemEdit.extras}" id="campoExtras">
                    </div>
                    <div>
                        <label>Total</label>
                        <input type="number" step="0.01" name="total" id="campoTotal" value="${ordemEdit.total}" readonly>
                    </div>
                </c:if>
            </div>

            <div class="modal-footer button-group">
                <button type="submit" class="btn-success">Salvar</button>
                <a href="ordens" class="btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
    </div>
</c:if>

<footer style="text-align: right; margin-top: 20px; font-size: 0.8em; color: #aaa;">
    <p>All Copyrights © Reserved - Created by Sidnei dos Santos</p>
    <p>Graduated in Computer Technician on January 12, 2024.</p>
</footer>

<script>
    const servicosSelecionados = [];

    <c:forEach var="s" items="${servicosSelecionados}">
    servicosSelecionados.push({
        id: '${s.idservico}',
        nome: '${s.nome} - R$ ${s.valor}',
        valor: parseFloat('${s.valor}')
    });
    </c:forEach>

    window.addEventListener('DOMContentLoaded', () => {
        const lista = document.getElementById('listaServicos')
        servicosSelecionados.forEach(servico => {
            const item = document.createElement('li');
            item.textContent = servico.nome;

            const btn = document.createElement('button');
            btn.textContent = 'Remover';
            btn.onclick = () => {
                lista.removeChild(item);
                servicosSelecionados.splice(servicosSelecionados.findIndex(s => s.id === servico.id), 1);
                atualizarTotal();
            };

            const inputHidden = document.createElement('input');
            inputHidden.type = 'hidden';
            inputHidden.name = 'servicosIds';
            inputHidden.value = servico.id;
            item.appendChild(inputHidden);
            item.appendChild(btn);
            lista.appendChild(item);
        });

        atualizarTotal();
    });

    // O conteúdo do form-orders.js ainda precisa ser incluído aqui ou em um arquivo JS separado
    // mas sem dependências de Bootstrap.
    // Para referência, incluí um placeholder.
    // Por exemplo, você pode ter funções como:
    function atualizarTotal() {
        let subtotal = servicosSelecionados.reduce((acc, s) => acc + s.valor, 0);
        const desconto = parseFloat(document.getElementById('campoDesconto').value) || 0;
        const extras = parseFloat(document.getElementById('campoExtras').value) || 0;
        let total = subtotal - desconto + extras;
        document.getElementById('campoTotal').value = total.toFixed(2);
    }

    document.addEventListener('DOMContentLoaded', () => {
        const btnAdicionarServico = document.getElementById('btnAdicionarServico');
        if (btnAdicionarServico) {
            btnAdicionarServico.addEventListener('click', () => {
                const selectServico = document.getElementById('selectServico');
                const selectedOption = selectServico.options[selectServico.selectedIndex];
                const servicoId = selectedOption.value;
                const servicoNome = selectedOption.textContent;
                const servicoValor = parseFloat(selectedOption.dataset.valor);

                // Evitar adicionar o mesmo serviço várias vezes, se for a intenção
                if (!servicosSelecionados.some(s => s.id === servicoId)) {
                    const novoServico = {
                        id: servicoId,
                        nome: servicoNome,
                        valor: servicoValor
                    };
                    servicosSelecionados.push(novoServico);

                    const lista = document.getElementById('listaServicos');
                    const item = document.createElement('li');
                    item.textContent = novoServico.nome;

                    const btnRemover = document.createElement('button');
                    btnRemover.textContent = 'Remover';
                    btnRemover.style.marginLeft = '10px'; // Estilo básico
                    btnRemover.onclick = () => {
                        lista.removeChild(item);
                        servicosSelecionados.splice(servicosSelecionados.findIndex(s => s.id === novoServico.id), 1);
                        atualizarTotal();
                    };

                    const inputHidden = document.createElement('input');
                    inputHidden.type = 'hidden';
                    inputHidden.name = 'servicosIds';
                    inputHidden.value = novoServico.id;
                    item.appendChild(inputHidden);
                    item.appendChild(btnRemover);
                    lista.appendChild(item);

                    atualizarTotal();
                }
            });
        }

        const campoDesconto = document.getElementById('campoDesconto');
        const campoExtras = document.getElementById('campoExtras');

        if (campoDesconto) {
            campoDesconto.addEventListener('input', atualizarTotal);
        }
        if (campoExtras) {
            campoExtras.addEventListener('input', atualizarTotal);
        }
    });
</script>
</body>
</html>