<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

</head>
<body>

<header class="sticky-top ">
    <div class="outer mb-5">
        <div class="items">
            <a href=""><img class="gov-gr-logo" src="${pageContext.request.contextPath}/img/gov_header_logo.svg" alt="" width="40" height="auto"></a>
            <h4> Coding Factory - Education Reinvented </h4>
        </div>
        <div class="d-flex align-items-center">
            <span>${sessionScope.username}</span>
            <c:if test="${sessionScope.username != null}">
                <a class="btn btn-primary mx-5" href="${pageContext.request.contextPath}/logout">Έξοδος</a>
            </c:if>
        </div>
    </div>
    <div class="">

    </div>
</header>
</body>
</html>