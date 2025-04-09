<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="d-flex justify-content-center align-items-center" style="height: 75vh">
       <div class="card w-25 text-center">
            <h2 class="pt-5 mb-5 text-grey">Login</h2>
            <div style="color: red;">${error} </div>
             <div>
               <c:if test="${requestScope.isError == 'true'}">
                   <p style="color: red">Login Error</p>
               </c:if>
             </div>
           <form method="POST" action="${pageContext.request.contextPath}/login">
                     <p class="mb-1">Username:</p>
                     <div class="mb-5">
                         <input type="email" name="username" required placeholder="Insert E-mail">
                         <span></span>
                     </div>
                     <div class="mb-5">
                     <p class="mb-1">Password:</p>
                         <input type="password" name="password" required placeholder="Insert Password">
                         <span></span>
                     </div>
                     <button class="btn btn-success rounded mb-5" type="submit">Sign In</button>
                     <div class="mb-2">
                       <a href="#">Lost your password?</a>
                     </div>
           </form>
          <div class="mb-5">
             <p> Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign up here!</a></p>
         </div>
          </div>
          </div>
    <%@include file="footer.jsp"%>
</body>
</html>