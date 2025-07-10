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
        <title>Service Order System - Início</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    </head>
    <body class="bg-dark text-white text-center">
        <jsp:include page="../components/perfil.jsp" />

        <div class="d-flex justify-content-center align-items-center flex-column text-center min-vh-100">
            <!-- Texto de boas-vindas -->
            <div class="mb-4">
                <h2>Bem-Vindo, ${usuario.nome}</h2>
                <h4>ao</h4> <h1>Service Order System</h1>
            </div>

            <!-- Botões Principais -->
            <div class="container">
                <div class="row justify-content-center gap-3">
                    <div class="col-md-3">
                        <a href="servicos" class="btn btn-outline-light btn-lg w-100 d-flex align-items-center justify-content-center gap-2">
                            <img src="${pageContext.request.contextPath}/resources/icons/servicos.png" alt="Serviços" class="img-fluid">
                            Serviços
                        </a>
                    </div>

                    <div class="col-md-3">
                        <a href="clientes" class="btn btn-outline-light btn-lg w-100 d-flex align-items-center justify-content-center gap-2">
                            <img src="${pageContext.request.contextPath}/resources/icons/cliente.png" alt="Clientes" class="img-fluid">
                            Clientes
                        </a>
                    </div>

                    <div class="col-md-3">
                        <a href="ordens" class="btn btn-outline-light btn-lg w-100 d-flex align-items-center justify-content-center gap-2">
                            <img src="${pageContext.request.contextPath}/resources/icons/servicossolicitados.png" alt="Ordens" class="img-fluid">
                            Ordens
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Rodapé -->
        <footer class="position-absolute bottom-0 end-0 p-2 text-white small">
            <p class="mb-0">All Copyrights © Reserved - Created by Sidnei dos Santos</p>
            <p class="mb-0">Graduated in Computer Technician on January 12, 2024.</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>
