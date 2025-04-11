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
    <title>Προβολή Καθηγητών</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>

<%@ include file="header.jsp"%>

<body>

<div class="d-flex justify-content-center align-items-center" style="height: 70vh">
<div class="card text-center w-50">
<div class="card-header py-0 text-center pt-3 bg-info">
        <p> Προβολή καθηγητών</p>
      </div>
  <div>
    <c:if test="${sessionScope.role == 'ADMIN'}">
       <div class="mt-5">
           <a class="btn btn-primary" href= "${pageContext.request.contextPath}/school-app/teachers/insert" >Εισαγωγή καθηγητή</a>
       </div>
    </c:if>

  </div>

<div class="input-group container w-50 mt-5 mb-5">
 <form class="d-flex column" id="filterForm" method="GET" action="${pageContext.request.contextPath}/school-app/teachers/view">
      <input type="text" class="form-control column" name="firstname" placeholder="Όνομα" aria-label="Recipient's username" aria-describedby="basic-addon2">
      <input type="text" class="form-control" name="lastname" placeholder="Επώνυμο" aria-label="Recipient's username" aria-describedby="basic-addon2">
      <div class="input-group-append d-flex column">
        <button class="btn btn-primary" type="submit">Αναζήτηση</button>
        <button class="btn btn-outline-secondary" id= "refreshPage" type="resetBtn" onclick="reset()">Επαναφορά</button>
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
           <c:forEach var = "teacher" items = "${requestScope.teachers}">
               <tr>
                   <td>${teacher.id}</td>
                   <td>${teacher.firstname}</td>
                   <td>${teacher.lastname}</td>
                   <td>
                   <a href="${pageContext.request.contextPath}/school-app/teachers/viewone?id=${teacher.id}"><i class="fa-regular fa-eye p-1"></i></a>

                   <c:if test="${sessionScope.role == 'ADMIN'}">
                   <a href="${pageContext.request.contextPath}/school-app/teachers/update?id=${teacher.id}"><i class="fa-solid fa-pen-to-square"></i></a>
                   <a href="${pageContext.request.contextPath}/school-app/teachers/delete?id=${teacher.id}" onclick="return confirm('Είστε σίγουρος οτι θέλετε να διαγράψετε τον καθηγητή;')"><i class="fa-solid text-danger fa-trash-can p-1"></i></a>
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


  <!-- Modal Structure -->
  <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-success text-white">
          <p class="modal-title" id="myModalLabel">Επιτυχημένη διαγραφή</P>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Διαγράψατε επιτυχημένα έναν καθηγητή!
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Κλείσιμο</button>
        </div>
      </div>
    </div>
  </div>

<%@ include file="footer.jsp"%>


  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Show Modal on Page Load -->
<script>
  window.addEventListener('load', function () {
    const modalElement = document.getElementById('myModal');
    const myModal = new bootstrap.Modal(modalElement);

    // Show the modal on page load
    myModal.show();

    // When modal is fully hidden, trigger the refresh button click
    modalElement.addEventListener('hidden.bs.modal', function () {
      document.getElementById('refreshPage').click();
    });
  });
</script>

<script src="${pageContext.request.contextPath}/js/teachers.js">

</body>

</script>
</html>