<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header role="banner">
<img alt="Books" src="images/chatappHEADER.png">
<h1><span>Chat App</span></h1>
<nav>
<ul>
    <c:choose>
        <c:when test="${param.title=='Home'}">
            <li><a href="Controller" id="actual">Home</a></li>
        </c:when>
        <c:otherwise>
            <li><a href="Controller">Home</a></li>
        </c:otherwise>
    </c:choose>

    <c:if test="${user != null}">
        <c:choose>
            <c:when test="${param.title=='Chat'}">
                <li><a href="Controller?action=Chat" id="actual">Chat</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="Controller?action=Chat">Chat</a></li>
            </c:otherwise>
        </c:choose>
    </c:if>
</ul>
</nav>
<h2>
${param.title}
</h2>

</header>