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
        <title>Service Order System - Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>
    <body class="bg-dark text-white text-center">
        <jsp:include page="../components/perfil.jsp" />

        <!-- Modal de Clientes -->
        <div class="modal fade show d-block" id="modalClientes" tabindex="-1" aria-labelledby="modalClientesLabel" aria-hidden="true" style="background-color: rgba(0,0,0,0.5);">
            <div class="modal-dialog modal-xl modal-dialog-centered">
                <div class="modal-content rounded-4 shadow-lg">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="modalClientesLabel">Gerenciador de Clientes</h5>
                        <a href="home" class="btn-close btn-close-white" aria-label="Fechar"></a>
                    </div>
                    <div class="modal-body">
                        <!-- Botão Novo Cliente -->
                        <div class="mb-3 text-end">
                            <a href="clientes?action=novo" class="btn btn-success">Novo Cliente</a>
                        </div>

                        <!-- Tabela de Clientes -->
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Telefone</th>
                                <th>Email</th>
                                <th>Endereço</th>
                                <th>Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="cliente" items="${clientes}">
                                <tr>
                                    <td>${cliente.idcliente}</td>
                                    <td>${cliente.nome}</td>
                                    <td>${cliente.telefone}</td>
                                    <td>${cliente.email}</td>
                                    <td>${cliente.endereco}</td>
                                    <td>
                                        <a href="clientes?action=editar&id=${cliente.idcliente}" class="btn btn-sm btn-warning">Editar</a>
                                        <a href="clientes?action=excluir&id=${cliente.idcliente}" class="btn btn-sm btn-danger">Excluir</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Formulário -->
        <c:if test="${modo == 'novo' || modo == 'editar'}">
            <div class="modal fade show d-block" id="modalForm" tabindex="-1" style="background-color: rgba(0,0,0,0.5);">
                <div class="modal-dialog">
                    <form method="post" class="modal-content bg-white text-dark">
                        <div class="modal-header bg-secondary text-white">
                            <h5 class="modal-title">${modo == 'novo' ? 'Novo Cliente' : 'Editar Cliente'}</h5>
                            <a href="clientes" class="btn-close btn-close-white"></a>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" name="modo" value="${modo}">
                            <c:if test="${modo == 'editar'}">
                                <input type="hidden" name="idcliente" value="${cliente.idcliente}">
                            </c:if>
                            <div class="mb-3">
                                <label class="form-label">Nome</label>
                                <input type="text" class="form-control" name="nome" value="${cliente.nome}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Telefone</label>
                                <input type="text" data-tipo="telefone" class="form-control" name="telefone" value="${cliente.telefone}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">E-mail</label>
                                <input type="email" class="form-control" name="email" value="${cliente.email}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Endereço</label>
                                <input type="text" class="form-control" name="endereco" value="${cliente.endereco}" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success" type="submit">Salvar</button>
                            <a href="clientes" class="btn btn-secondary">Cancelar</a>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/5.0.9/inputmask.min.js" integrity="sha512-eD+19OyeG3GbJ6QGk9uI7TfTozYXAVPz6/Va/YVVuBz7ZFvAeiFzol0whJplf9l6cNQcA8sVxVXvCFW489cAVA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="${pageContext.request.contextPath}/resources/js/phone-formatter.js"></script>
    </body>
</html>
