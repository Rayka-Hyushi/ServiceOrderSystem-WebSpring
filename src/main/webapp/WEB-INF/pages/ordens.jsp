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
        <title>Service Order System - Ordens de Serviço</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>
    <body class="bg-dark text-white d-flex align-items-center justify-content-center vh-100">
        <jsp:include page="../components/perfil.jsp" />

        <!-- Modal de Ordens -->
        <div class="modal fade show d-block" id="modalOrdens" tabindex="-1" aria-labelledby="modalOrdensLabel" aria-hidden="true" style="background-color: rgba(0,0,0,0.5);">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content rounded-4 shadow-lg">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="modalOrdensLabel">Gerenciador de Ordens ${modo}</h5>
                        <a href="home" class="btn-close btn-close-white" aria-label="Fechar"></a>
                    </div>
                    <div class="modal-body">
                        <!-- Botão Nova Ordem -->
                        <div class="mb-3 text-end">
                            <a href="ordens?action=novo" class="btn btn-success">Nova Ordem</a>
                        </div>

                        <!-- Tabela de Ordens -->
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-light">
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
                                        <td>${ordem.desconto}</td>
                                        <td>${ordem.extras}</td>
                                        <td>${ordem.total}</td>
                                        <td>${ordem.status}</td>
                                        <td>
                                            <a href="ordens?action=editar&id=${ordem.osid}&idcliente=${ordem.cliente.idcliente}" class="btn btn-sm btn-warning">Editar</a>
                                            <a href="ordens?action=excluir&id=${ordem.osid}" class="btn btn-sm btn-danger">Excluir</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Formulário de Ordem de Serviço -->
        <c:if test="${modo == 'novo' || modo == 'editar'}">
            <div class="modal show fade d-block" id="modalFormO" tabindex="-1" style="background-color: rgba(0,0,0,0.5);">
                <div class="modal-dialog modal-lg">
                    <form method="post" class="modal-content bg-white text-dark">
                        <div class="modal-header bg-secondary text-white">
                            <h5 class="modal-title">${modo == 'novo' ? 'Nova Ordem de Serviço' : 'Editar Ordem de Serviço'}</h5>
                            <a href="ordens" class="btn-close btn-close-white"></a>
                        </div>

                        <div class="modal-body">
                            <input type="hidden" name="modo" value="${modo}">
                            <c:if test="${modo == 'editar'}">
                                <input type="hidden" name="osid" value="${ordemEdit.osid}">
                            </c:if>

                            <!-- Cliente -->
                            <c:if test="${modo == 'novo'}">
                                <div class="mb-3">
                                    <select class="form-control" name="idcliente">
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
                            </c:if>
                            <c:if test="${modo == 'editar'}">
                                <div class="mb-3">
                                    <div class="mb-3">
                                        <label class="form-label"><strong>Cliente</strong></label>
                                        <c:if test="${not empty ordemEdit && not empty ordemEdit.cliente}">
                                            <div class="form-control-plaintext">
                                                <strong>Idcliente:</strong> <c:out value="${ordemEdit.cliente.idcliente}" /> <br>
                                                <strong>Nome:</strong> <c:out value="${ordemEdit.cliente.nome}" /> <br>
                                                <strong>E-mail:</strong> <c:out value="${ordemEdit.cliente.email}" /> <br>
                                                <strong>Telefone:</strong> <c:out value="${ordemEdit.cliente.telefone}" />
                                            </div>
                                        </c:if>
                                        <c:if test="${empty ordemEdit || empty ordemEdit.cliente}">
                                            <p class="form-control-plaintext text-muted">Cliente não associado ou não encontrado.</p>
                                        </c:if>
                                    </div>
                                </div>
                            </c:if>

                            <!-- Descrição -->
                            <div class="mb-3">
                                <label class="form-label"><strong>Descrição</strong></label>
                                <textarea class="form-control" name="descricao" required><c:out value='${ordemEdit.descricao}'/></textarea>
                            </div>

                            <!-- Status -->
                            <c:if test="${modo == 'editar'}">
                                <div class="mb-3">
                                    <label class="form-label"><strong>Status</strong></label>
                                    <select name="status" class="form-control">
                                        <option value="Pendente" <c:if test="${ordemEdit.status == 'Pendente'}">selected</c:if>>Pendente</option>
                                        <option value="Finalizado" <c:if test="${ordemEdit.status == 'Finalizado'}">selected</c:if>>Finalizado</option>
                                    </select>
                                </div>
                            </c:if>

                            <!-- Serviços -->
                            <c:if test="${modo == 'editar'}">
                                <div class="mb-3">
                                    <label class="form-label"><strong>Serviços</strong></label>
                                    <div class="input-group">
                                        <select id="selectServico" class="form-control">
                                            <c:forEach var="s" items="${servicos}">
                                                <option value="${s.idservico}" data-valor="${s.valor}">${s.nome} - R$ ${s.valor}</option>
                                            </c:forEach>
                                        </select>
                                        <button type="button" class="btn btn-primary" id="btnAdicionarServico">Adicionar</button>
                                    </div>
                                </div>

                                <ul class="list-group mb-3" id="listaServicos">
                                    <!-- Serviços adicionados aparecerão aqui -->
                                </ul>

                                <div class="mb-3">
                                    <label class="form-label"><strong>Desconto</strong></label>
                                    <input type="number" step="0.01" name="desconto" class="form-control" value="${ordemEdit.desconto}" id="campoDesconto">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label"><strong>Extras</strong></label>
                                    <input type="number" step="0.01" name="extras" class="form-control" value="${ordemEdit.extras}" id="campoExtras">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label"><strong>Total</strong></label>
                                    <input type="number" step="0.01" name="total" class="form-control" id="campoTotal" value="${ordemEdit.total}" readonly>
                                </div>
                            </c:if>
                        </div>

                        <div class="modal-footer">
                            <button class="btn btn-success" type="submit">Salvar</button>
                            <a href="ordens" class="btn btn-secondary">Cancelar</a>
                        </div>
                    </form>
                </div>
            </div>
        </c:if>

        <!-- Rodapé -->
        <footer class="position-absolute bottom-0 end-0 p-2 text-white small">
            <p class="mb-0">All Copyrights © Reserved - Created by Sidnei dos Santos</p>
            <p class="mb-0">Graduated in Computer Technician on January 12, 2024.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resources/js/form-orders.js"></script>
        <script>
            <c:forEach var="s" items="${servicosSelecionados}">
                servicosSelecionados.push({
                    id: '${s.idservico}',
                    nome: '${s.nome} - R$ ${s.valor}',
                    valor: parseFloat('${s.valor}')
                });
            </c:forEach>
        </script>
    </body>
</html>