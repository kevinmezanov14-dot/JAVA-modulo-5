<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<style>
.error {
	color: red;
	font-weight: bold;
}

.success {
	color: green;
	font-weight: bold;
}

.warning {
	color: orange;
	font-weight: bold;
}
</style>
</head>
<body>
	<%-- <h1>Colección</h1>
	<div class="container">
		<c:set value="500" var="importe" />

		<c:out value="${importe}" />
		<c:set value="Profe" var="nombre" />
		<c:set var="nombre" value="${fn:replace(nombre, 'e', '3')}" />
		<c:out value="${nombre}" />


		<c:out value="${nombre}" />
		<c:set value="${importe*.21}" var="iva" />

		<c:out value="${iva}" />
		<c:if test="${iva > 100}">
			<p>¡Que caro!</p>
		</c:if>
		<c:choose>
			<c:when test="${iva < 100}">
				<c:out value="${iva} menor de 100" />
			</c:when>
			<c:when test="${iva < 200}">
				<c:out value="${iva} menor de 200" />
			</c:when>
			<c:otherwise>
				<c:out value="${iva} mayor de 200" />
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" items="1,4,5,6,7,8,9">
			<p>
				Item
				<c:out value="Nº ${i}" />
			</p>
		</c:forEach> --%>

		<%
    // Simulamos datos que podrían venir de un formulario o BD
    String[] medios = {"Efectivo", "Tarjeta", "Depósito", "", null, "TARJETA", "invalido"};
    request.setAttribute("mediosDePago", medios);
    request.setAttribute("montoInicial", 1000);
		%>

		<c:choose>
			<c:when test="${montoInicial <= 0}">
				<p class="error">⚠ El monto inicial debe ser mayor a 0.</p>
			</c:when>
			<c:otherwise>
				<h2>
					Monto inicial: $
					<c:out value="${montoInicial}" />
				</h2>
				<hr />


				<c:forEach items="${mediosDePago}" var="medio" varStatus="estado">

					<h3>
						Registro #
						<c:out value="${estado.index + 1}" />
					</h3>
					<c:choose>
						<c:when test="${empty medio}">
							<p class="error">✗ El medio de pago no puede estar vacío.</p>
						</c:when>

						<c:otherwise>

							<c:set var="medioNormalizado"
								value="${fn:toLowerCase(fn:trim(medio))}" />
							<c:choose>

								<c:when
									test="${medioNormalizado == 'efectivo' or
                                        medioNormalizado == 'tarjeta'  or
                                        medioNormalizado == 'depósito' or
                                        medioNormalizado == 'deposito'}">
                                        
									<c:choose>

										<c:when test="${medioNormalizado == 'efectivo'}">
											<c:set var="interes" value="0" />
											<c:set var="porcentaje" value="0%" />
										</c:when>

										<c:when test="${medioNormalizado == 'tarjeta'}">
											<c:set var="interes" value="${montoInicial * 0.10}" />
											<c:set var="porcentaje" value="10%" />
										</c:when>

										<c:otherwise>
											<c:set var="interes" value="${montoInicial * 0.20}" />
											<c:set var="porcentaje" value="20%" />
										</c:otherwise>

									</c:choose>

									<c:set var="montoFinal" value="${montoInicial + interes}" />

									<p class="success">
										Medio válido:
										<c:out value="${fn:toUpperCase(medio)}" />
									</p>
									<p>
										Porcentaje de interés :
										<c:out value="${porcentaje}" />
									</p>
									<p>
										Interés aplicado : $
										<c:out value="${interes}" />
									</p>
									<p>
										<strong>Monto final : $<c:out value="${montoFinal}" /></strong>
									</p>

								</c:when>

								<c:otherwise>
									<p class="warning">
										⚠ Medio de pago "
										<c:out value="${medio}" />
										" no reconocido. Los medios válidos son: Efectivo, Tarjeta,
										Depósito.
									</p>
								</c:otherwise>

							</c:choose>

						</c:otherwise>
					</c:choose>

					<hr />
				</c:forEach>

			</c:otherwise>
		</c:choose>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
			crossorigin="anonymous"></script>
</body>
</html>