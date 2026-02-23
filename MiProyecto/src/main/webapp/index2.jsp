<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
      crossorigin="anonymous">
  </head>
  <body>
    <div class="container mt-5">
      <h2 class="mb-4">Formulario de Operación</h2>
      <form action="proceso.jsp" method="post">

        <div class="mb-3">
          <label for="nombre" class="form-label">Nombre de usuario</label>
          <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese su nombre" required>
        </div>

        <div class="mb-3">
          <label for="operacion" class="form-label">Operación</label>
          <select class="form-select" id="operacion" name="operacion" required>
            <option value="" disabled selected>Seleccione una operación</option>
            <option value="Depósito">Depósito</option>
            <option value="Extracción">Extracción</option>
            <option value="Transferencia">Transferencia</option>
          </select>
        </div>

        <div class="mb-3">
          <label class="form-label">Tipo de moneda</label><br>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="moneda" id="pesos" value="Pesos" required>
            <label class="form-check-label" for="pesos">Pesos</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="moneda" id="dolares" value="Dólares">
            <label class="form-check-label" for="dolares">Dólares</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="moneda" id="euros" value="Euros">
            <label class="form-check-label" for="euros">Euros</label>
          </div>
        </div>

        <button type="submit" class="btn btn-primary">Enviar</button>
      </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
      crossorigin="anonymous"></script>
  </body>
</html>