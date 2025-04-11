<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Προβολή Μαθητών</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>

<body>

<%@ include file="header.jsp"%>

<div class="d-flex justify-content-center align-items-center" style="height: 70vh">
<div class="card text-center w-50">
<div class="card-header py-0 text-center pt-3 bg-warning">
        <p> Προβολή μαθητών</p>
      </div>
  <div>
    <c:if test="${sessionScope.role == 'ADMIN'}">
       <div class="mt-5">
           <a class="btn btn-primary" href= "${pageContext.request.contextPath}/school-app/students/insert">Εισαγωγή μαθητή</a>
       </div>
    </c:if>

  </div>

<div class="input-group container w-50 mt-5 mb-5">
 <form class="d-flex column" id="filterForm" method="GET" action="${pageContext.request.contextPath}/school-app/students/view">
      <input type="text" class="form-control column" name="firstname" placeholder="Όνομα" aria-label="Recipient's username" aria-describedby="basic-addon2">
      <input type="text" class="form-control" name="lastname" placeholder="Επώνυμο" aria-label="Recipient's username" aria-describedby="basic-addon2">
      <div class="input-group-append d-flex column">
        <button class="btn btn-primary" type="submit">Αναζήτηση</button>
        <button class="btn btn-outline-secondary" type="resetBtn" onclick="reset()">Επαναφορά</button>
      </div>
      </form>
    </div>


       <table class="table table-striped mb-2 table-bordered table-hover mb-5">
           <thead>
               <tr>
                   <th class="col-1" scope="col">Κωδικός</th>
                   <th class="col-3" scope="col">Όνομα</th>
                   <th class="col-3" scope="col">Επώνυμο</th>
                   <th class="col-1" scope="col">Πράξεις</th>
               </tr>
           </thead>
   <%--        <p>${requestScope.message}</p>--%>
           <c:forEach var = "student" items = "${requestScope.students}">
               <tr>
                   <td>${student.id}</td>
                   <td>${student.firstname}</td>
                   <td>${student.lastname}</td>
                   <td>
                   <a href="${pageContext.request.contextPath}/school-app/students/viewone?id=${student.id}"><i class="fa-regular fa-eye p-1"></i></a>

                   <c:if test="${sessionScope.role == 'ADMIN'}">
                   <a href="${pageContext.request.contextPath}/school-app/students/update?id=${student.id}"><i class="fa-solid fa-pen-to-square"></i></a>
                   <a href="${pageContext.request.contextPath}/school-app/students/delete?id=${student.id}" onclick="return confirm('Είστε σίγουρος οτι θέλετε να διαγράψετε τον μαθητή;')"><i class="fa-solid text-danger fa-trash-can p-1"></i></a>
                   </c:if>
                   </td>
               </tr>
           </c:forEach>
       </table>
         <div>


         <%--    <c:if test="${requestScope.deleteAPIError}">--%>
                  <p class="text-danger" >${requestScope.message}</p>
         <%--    </c:if>--%>


          </div>
   </div>



   <div>
       <c:if test="${requestScope.updateAPIError}">
           <p>Something went wrong in Update</p>
       </c:if>
   </div>
   </div>
   </div>
</body>

<%@ include file="footer.jsp"%>

<script src="${pageContext.request.contextPath}/js/students.js">

</script>
</html>
