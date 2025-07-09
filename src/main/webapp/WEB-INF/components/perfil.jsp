<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!-- Topo: Foto + Dropdown -->
<div class="position-fixed p-3 end-0">
    <div class="perfil-container">
        <img src="${empty usuario.foto ? '/resources/images/default-profile.jpg' : usuario.foto}" class="foto-perfil"
             id="btnPerfil" alt="Perfil">
        <div class="dropdown" id="dropdownPerfil">
            <div class="topo">
                <p class="email">${usuario.email}</p>
                <img src="${empty usuario.foto ? '/resources/images/default-profile.jpg' : usuario.foto}"
                     class="foto-grande" alt="Foto Grande">
                <p class="nome">Olá, ${usuario.nome}!</p>
            </div>
            <div class="botoes">
                <button class="btn-esquerda" data-bs-toggle="modal" data-bs-target="#modalFoto">
                    Gerenciar Conta
                </button>
                <button class="btn-direita" onclick="location.href='/logout'">
                    Sair
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Alterar Foto -->
<div class="modal fade" id="modalFoto" tabindex="-1" aria-labelledby="modalFotoLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="${pageContext.request.contextPath}/usuario/alterar" enctype="multipart/form-data"
              class="modal-content">
            <input type="hidden" name="action" value="alterar">
            <div class="modal-header">
                <h5 class="modal-title" id="modalFotoLabel">Meu Perfil</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Fechar"></button>
            </div>
            <div class="modal-body">
                <!-- mostrar a foto que o usuario selecionou -->
                <input type="file" name="foto" accept="image/*" required class="form-control">

                <div class="mb-3">
                    <label for="username">Usuário: </label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>

                <div class="mb-3">
                    <label for="email">E-mail: </label>
                    <input type="email" class="form-control" id="email" name="email">
                </div>

                <div class="mb-3">
                    <label for="password">Senha: </label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
            </div>

            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Salvar</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            </div>
        </form>
    </div>
</div>

<script>
    document.getElementById("btnPerfil").addEventListener("click", function () {
        const dropdown = document.getElementById("dropdownPerfil");
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    });

    window.addEventListener("click", function (e) {
        const dropdown = document.getElementById("dropdownPerfil");
        if (!e.target.closest(".perfil-container")) {
            dropdown.style.display = "none";
        }
    });
</script>