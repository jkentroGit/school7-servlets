<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Update</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/teacher-update.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>
<%@ include file="header.jsp"%>


<div class="container col-3 card p-0 mt-5">
<span class="card-header text-xl-center text-lg"> Εμφάνιση καθηγητή </span>

  <div class="card-body p-0 col-0 text-center mt-5">
    <div class="mb-5">
      <form class="d-flex flex-column" method="GET" action="">
              <input type="hidden" name="id" value="${requestScope.updateDTO.id}" >

                  <div class="input-group container mb-3">
                    <div class="input-group-text col-5">Όνομα</div>
                      <input class="form-control col-5" type="text" name="firstname" value="${requestScope.updateDTO.firstname}" placeholder="Όνομα" readonly></input>

                  </div>
                  <div class="input-group container mb-3">
                    <label class="input-group-text col-5">Επώνυμο</label>
                      <input class="form-control col-3" type="text" name="lastname" value="${requestScope.updateDTO.lastname}" placeholder="Επώνυμο" readonly></input>

                   </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-5">ΑΦΜ</label>
                  <input class="form-control" type="text" name="vat" value="${requestScope.updateDTO.vat}" placeholder="ΑΦΜ" readonly></input>

              </div>
              <div class="input-group container mb-3">
                  <label class="input-group-text col-5">Επώνυμο Πατρός</label>
                  <input class="form-control" type="text" name="fathername" value="${requestScope.updateDTO.fatherName}" placeholder="Επώνυμο Πατρός" readonly></input>

              </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-5">Αριθμός Τηλεφώνου</label>
                  <input class="form-control" type="text" name="phoneNum" value="${requestScope.updateDTO.phoneNum}" placeholder="Αριθμός Τηλεφώνου" readonly></input>

                </div>

                <div class="input-group container mb-3">
                  <label class="input-group-text col-5">E-mail</label>
                  <input class="form-control" type="text" name="email" value="${requestScope.updateDTO.email}" placeholder="E-mail" readonly></input>

                </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-5">Οδός</label>
                  <input class="form-control" type="text" name="street" value="${requestScope.updateDTO.street}" placeholder="Οδός" readonly></input>

                </div>

                <div class="input-group container mb-3">
                  <label class="input-group-text col-5">Αριθμός</label>
                  <input class="form-control" type="text" name="streetNum" value="${requestScope.updateDTO.streetNum}" placeholder="Αριθμός" readonly></input>

              </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-5">ΤΚ</label>
                  <input class="form-control" type="text" name="zipcode" value="${requestScope.updateDTO.zipCode}" placeholder="TK" readonly></input>

                </div>


            <c:set var="selectedCityName" value="" />

            <c:forEach var="city" items="${cities}">
                <c:if test="${city.id eq requestScope.updateDTO.cityId}">
                    <c:set var="selectedCityName" value="${city.name}" />
                </c:if>
            </c:forEach>


                <div class="input-group container mb-3">
                  <label class="input-group-text col-5">Πόλη</label>
                  <input class="form-control" type="text" name="City" value="${selectedCityName}" placeholder= "${selectedCityName}" readonly></input>

                 </div>


      </form>

    </div>

    <div class="card-footer">
    <div>
      <a href="${pageContext.request.contextPath}/school-app/teachers/view">Επιστροφή</a>
    </div>
    <div>
      ${requestScope.errorMessage}
    </div>
  </div>


  </div>
  </div>
  </body>
<%@ include file="footer.jsp"%>
</html>
