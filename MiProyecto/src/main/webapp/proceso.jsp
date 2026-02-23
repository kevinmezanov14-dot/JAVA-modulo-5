<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Resultado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
      crossorigin="anonymous">
  </head>
  <body>
    <div class="container mt-5">
      <h2 class="mb-4">Datos recibidos</h2>

      <ul class="list-group">
        <li class="list-group-item">
          <strong>Nombre de usuario:</strong> ${param.nombre}
        </li>
        <li class="list-group-item">
          <strong>Operación seleccionada:</strong> ${param.operacion}
        </li>
        <li class="list-group-item">
          <strong>Tipo de moneda:</strong> ${param.moneda}
        </li>
      </ul>

      <a href="index2.jsp" class="btn btn-secondary mt-4">Volver al formulario</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
      crossorigin="anonymous"></script>
  </body>
</html>