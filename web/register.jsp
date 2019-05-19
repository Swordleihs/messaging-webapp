<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Register"/>
    </jsp:include>
    <body>
        <jsp:include page="header.jsp">
            <jsp:param name="title" value="Register" />
        </jsp:include>
        <main>
            <c:if test="${errors.size()>0 }">
                <div class="danger">
                    <ul>
                        <c:forEach var="error" items="${errors }">
                            <li><c:out value="${error}"/></li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>
            <form method="post" action="Controller?action=Register">
                <p>
                    <label for="firstname">First Name</label>
                    <input type="text" class="inputText" id="firstname" name="firstname" value="<c:out value='${previousFirstname}'/>" placeholder="first name...">
                </p>
                <p>
                    <label for="lastname">Last Name</label>
                    <input type="text" class="inputText" id="lastname" name="lastname" value="<c:out value='${previousLastname}'/>" placeholder="last name...">
                </p>
                <p>
                    <label for="gender">Gender</label>
                    <select id="gender">
                        <option>Male</option>
                        <option>Female</option>
                    </select>
                </p>
                <p>
                    <label for="age">Age</label>
                    <input type="number" id="age" name="age" value="<c:out value='${previousAge}'/>" placeholder="age..." step="1">
                </p>
                <p>
                    <label for="email">Email</label>
                    <input type="email" class="inputText" id="email" name="email" value="<c:out value='${previousEmail}'/>" placeholder="email...">
                </p>
                <p>
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="password...">
                </p>
                <p>
                    <label for="passwordCon">Password Confirmation</label>
                    <input type="password" id="passwordCon" name="passwordCon" placeholder="password...">
                </p>
                <p>
                    <input type="submit" id="loginbutton" value="Register">
                </p>
            </form>
        </main>
        <jsp:include page="footer.jsp">
            <jsp:param name="title" value="Home" />
        </jsp:include>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/blog.js"></script>
    </body>
</html>