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
<title>Student Update</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<%@ include file="header.jsp"%>

<div class="d-flex justify-content-center align-items-center" style="height: 70vh">
<div class="container card p-0 mt-5">
<span class="card-header text-xl-center text-lg bg-warning"> Eπεξεργασία μαθητή </span>

  <div class="card-body p-0 col-0 text-center mt-5">
    <div class=" mb-5  mx-auto">
      <form class="w-10 mx-auto d-flex flex-column" method="POST" action="${pageContext.request.contextPath}/school-app/students/update">
              <input type="hidden" name="id" value="${requestScope.updateDTO.id}" >

                  <div class="input-group container mb-3">
                    <div class="input-group-text col-3">Όνομα</div>
                      <input class="form-control col-3" type="text" name="firstname" value="${requestScope.updateDTO.firstname}" placeholder="Όνομα"></input>
                      <div class="validation-error">${sessionScope.firstnameMessage}</div>
                  </div>
                  <div class="input-group container mb-3">
                    <label class="input-group-text col-3">Επώνυμο</label>
                      <input class="form-control col-3" type="text" name="lastname" value="${requestScope.updateDTO.lastname}" placeholder="Επώνυμο"></input>
                      <p class="validation-error">${sessionScope.lastnameMessage}</p>
                   </div>

              <div class="input-group container mb-3">
                  <label class="input-group-text col-3">Επώνυμο Πατρός</label>
                  <input class="form-control" type="text" name="fathername" value="${requestScope.updateDTO.fatherName}" placeholder="Επώνυμο Πατρός"></input>
                  <p class="validation-error">${sessionScope.fathernameMessage}</p>
              </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-3">Αριθμός Τηλεφώνου</label>
                  <input class="form-control" type="text" name="phoneNum" value="${requestScope.updateDTO.phoneNum}" placeholder="Αριθμός Τηλεφώνου"></input>
                  <p class="validation-error">${sessionScope.phoneNumMessage}</p>
                </div>

                <div class="input-group container mb-3">
                  <label class="input-group-text col-3">E-mail</label>
                  <input class="form-control" type="text" name="email" value="${requestScope.updateDTO.email}" placeholder="E-mail"></input>
                  <p class="validation-error">${sessionScope.emailMessage}</p>
                </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-3">Οδός</label>
                  <input class="form-control" type="text" name="street" value="${requestScope.updateDTO.street}" placeholder="Οδός"></input>
                  <p class="validation-error">${sessionScope.streetMessage}</p>
                </div>

                <div class="input-group container mb-3">
                  <label class="input-group-text col-3">Αριθμός</label>
                  <input class="form-control" type="text" name="streetNum" value="${requestScope.updateDTO.streetNum}" placeholder="Αριθμός"></input>
                  <p class="validation-error">${sessionScope.streetNumMessage}</p>
              </div>
              <div class="input-group container mb-3">
                <label class="input-group-text col-3">ΤΚ</label>
                  <input class="form-control" type="text" name="zipcode" value="${requestScope.updateDTO.zipCode}" placeholder="TK"></input>
                  <p class="validation-error">${sessionScope.zipcodeMessage}</p>
                </div>

              <div class="input-group container mb-3">
                              <label class="input-group-text col-3">Πόλη</label>

                                  <select class= "form-select " name="cityId">

                                    <option value="" disabled ${empty updateDTO.cityId ? 'selected' : ''}>Select City</option>
                                    <c:forEach items="${cities}" var="city">
                                      <option value="${city.id}" ${city.id eq updateDTO.cityId ? 'selected' : ''}>
                                        ${city.name}
                                      </option>
                                    </c:forEach>
                                </select>
                              </div>
                  <p class="validation-error">${sessionScope.cityIdMessage}</p>

              <div>
                  <button class="btn btn-success" type="submit">Εισαγωγή</button>
              </div>

      </form>

    </div>

    <div class="card-footer">
    <div>
      <a href="${pageContext.request.contextPath}/school-app/students/view">Επιστροφή</a>
    </div>
    <div>
      ${requestScope.errorMessage}
    </div>
  </div>


  </div>
  </div>
  </div>
  </body>

<%@ include file="footer.jsp"%>
</html>


