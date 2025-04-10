<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ include file="header.jsp"%>

<div class="d-flex justify-content-center align-items-center" style="height: 70vh">

    <div class="w-25 card d-flex " style="height: 25vh">

      <div class="card-header text-center pt-4">
        <p>Επιλέξτε τομέα</p>
      </div>

      <div class="d-flex flex-row align-items-center justify-content-center " style="height: 75vh" >

        <div class=" px-1">
          <div class="dropdown">
            <button class="btn btn-lg btn-info dropdown-toggle" style="width: 200px" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              Καθηγητές
            </button>
            <ul class="dropdown-menu">


              <li><a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/view'/>">Προβολή καθηγητών</a></li>

              <c:if test="${sessionScope.role == 'ADMIN'}">
              <li>
              <a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/teachers/insert'/>">Εισαγωγή καθηγητών</a>
              </li>
              </c:if>

              <c:if test="${sessionScope.role != 'ADMIN'}">
              <li>
              <a class="dropdown-item text-sm disabled" href="">Εισαγωγή καθηγητών <i class="fa-solid fa-lock"></i> </a>
              </li>
              </c:if>


            </ul>
          </div>
        </div>

        <div class=" px-1">
          <div class="dropdown">
            <button class="btn btn-lg btn-warning dropdown-toggle" style="width: 200px" type="button" data-bs-toggle="dropdown" aria-expanded="false">
              Μαθητές
            </button>
            <ul class="dropdown-menu">
             <li><a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/students/view'/>">Προβολή μαθητών</a></li>

             <c:if test="${sessionScope.role == 'ADMIN'}">
             <li>
             <a class="dropdown-item" href="<c:url value='${pageContext.request.contextPath}/school-app/students/insert'/>">Εισαγωγή μαθητών</a><i class="fa-solid fa-lock"></i>
             </li>
             </c:if>

             <c:if test="${sessionScope.role != 'ADMIN'}">
             <li>
             <a class="dropdown-item disabled" href="">Εισαγωγή καθηγητών <i class="fa-solid fa-lock"></i> </a>
             </li>
              </c:if>



            </ul>
          </div>
        </div>

    </div>
  </div>
</div>


<%@ include file="footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
