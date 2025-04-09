<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Εγγραφή Χρήστη</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%@ include file="header.jsp"%>

<div class="d-flex justify-content-center align-items-center" style="height: 70vh">

    <div class="card text-center w-25">
               <form class="w-20 text-center align-content-center" method="POST" action="${pageContext.request.contextPath}/register">
                <div class="mb-3 pt-5">
                  <p class="mb-1"> Username:</p>
                    <input class="m-bottom" type="email" name="username" value="${requestScope.userRegisterDTO.username}" required placeholder="Insert email">
                    <p class="text-danger-emphasis">${requestScope.usernameMessage}</p>
                </div>
                <div class="mb-3">
                  <p class="mb-1"> Password:</p>
                    <input class="m-bottom" type="password" name="password" value="${requestScope.userRegisterDTO.password}" required placeholder="Insert Password">
                    <p class="text-danger-emphasis">${requestScope.passwordMessage}</p>
                </div>
                <div class="mb-3">
                  <p class="mb-1"> Confirm Password:</p>
                    <input class="m-bottom" type="password" name="confirmPassword" value="${requestScope.userRegisterDTO.confirmPassword}" required placeholder="Confirm Password">
                    <p class="text-danger-emphasis">${requestScope.confirmPasswordMessage}</p>
                </div>
                <div >
                  <p class="mb-1">Ρόλος:</p>
                    <select class="mb-2" name="role">
                        <option value="ADMIN">Διαχειριστής</option>
                        <option value="LIGHT_ADMIN">Βοηθός Διαχειριστή</option>
                    </select>
                    <p class="text-danger-emphasis mb-4">${requestScope.roleMessage}</p>
                </div>

                <div>
                    <button class="btn btn-success btn-md" type="submit">Εγγραφή</button>
                </div>
            </form>
            <div class="mb-3 mt-1">
            <a href="${pageContext.request.contextPath}/login">Επιστροφή</a>
            </div>
        <div>
            ${requestScope.errorMessage}
        </div>
    </div>

<%@ include file="footer.jsp"%>

</body>
</html>
