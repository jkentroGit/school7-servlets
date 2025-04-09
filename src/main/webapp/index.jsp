<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Central Service</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="container-fluid">

    <%@ include file="/WEB-INF/jsp/header.jsp" %>


<!-- Main Content -->

<div class= "d-flex justify-content-center align-items-center" style="height: 75vh">
<div class="text-center">
    <h4 class="mt-5 mb-5 ">Κεντρική Υπηρεσία Coding Factory</h4>
    <div class=" mt-5 mb-5 ">
    <a href="${pageContext.request.contextPath}/login" class="btn btn-success btn-md rounded">Συνέχεια</a>
    </div>

</div>
</div>


<%@ include file="/WEB-INF/jsp/footer.jsp" %>

</html>