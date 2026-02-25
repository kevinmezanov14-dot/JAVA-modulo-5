<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - MiProyecto</title>

    <!-- Bootstrap CSS 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Tu CSS personalizado -->
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark" style="background: linear-gradient(135deg,#667eea,#764ba2);">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center gap-2" href="#">
            <i class="bi bi-book"></i> Biblioteca Digital
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarMenu">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="#"><i class="bi bi-house"></i> Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-book-fill"></i> Libros</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-gear"></i> Configuración</a>
                </li>
            </ul>
            <div class="d-flex align-items-center gap-2">
                <div class="user-avatar bg-white text-primary d-flex justify-content-center align-items-center rounded-circle" style="width:40px;height:40px;">
                    <i class="bi bi-person-fill"></i>
                </div>
                <span class="text-white">${sessionScope.usuario}</span>
                <a href="logout" class="btn btn-outline-light btn-sm d-flex align-items-center gap-1">
                    <i class="bi bi-box-arrow-right"></i> Cerrar Sesión
                </a>
            </div>
        </div>
    </div>
</nav>

<!-- CONTENIDO -->
<div class="container my-5">
    <div class="card p-4 mb-4">
        <h1>Bienvenido, ${sessionScope.usuario}</h1>
        <p>Este es tu dashboard de MiProyecto.</p>
    </div>

    <div class="row g-4">
        <div class="col-md-6 col-lg-4">
            <a href="<%= request.getContextPath() %>/Libros" class="card text-decoration-none text-dark p-4 h-100 d-flex flex-column align-items-center justify-content-center">
                <i class="bi bi-book fs-1 mb-3"></i>
                <h5>Colección de Libros</h5>
                <p class="text-muted text-center">Explora y administra todos los libros disponibles</p>
            </a>
        </div>

        <div class="col-md-6 col-lg-4">
            <a href="#" onclick="alert('Funcionalidad en desarrollo'); return false;" class="card text-decoration-none text-dark p-4 h-100 d-flex flex-column align-items-center justify-content-center">
                <i class="bi bi-gear fs-1 mb-3"></i>
                <h5>Configuración</h5>
                <p class="text-muted text-center">Ajusta tus preferencias</p>
            </a>
        </div>

        <div class="col-md-6 col-lg-4">
            <a href="#" onclick="alert('Funcionalidad en desarrollo'); return false;" class="card text-decoration-none text-dark p-4 h-100 d-flex flex-column align-items-center justify-content-center">
                <i class="bi bi-bar-chart fs-1 mb-3"></i>
                <h5>Estadísticas</h5>
                <p class="text-muted text-center">Revisa tus datos</p>
            </a>
        </div>

        <div class="col-md-6 col-lg-4">
            <a href="#" onclick="alert('Funcionalidad en desarrollo'); return false;" class="card text-decoration-none text-dark p-4 h-100 d-flex flex-column align-items-center justify-content-center">
                <i class="bi bi-person fs-1 mb-3"></i>
                <h5>Perfil</h5>
                <p class="text-muted text-center">Edita tu información</p>
            </a>
        </div>
    </div>
</div>

<!-- Bootstrap JS 5.3 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
