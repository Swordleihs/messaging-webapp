<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Home"/>
    </jsp:include>

    <body onload="openSocket();">

        <jsp:include page="header.jsp">
            <jsp:param name="title" value="Home" />
        </jsp:include>

        <main>

            <c:if test="${registerSucces}">
                <div class="success">
                    <ul>
                        <li>Your registration was successful.</li>
                    </ul>
                </div>
            </c:if>

            <c:if test="${errors.size()>0 }">
                <div class="danger">
                    <ul>
                        <c:forEach var="error" items="${errors }">
                            <li>${error }</li>
                        </c:forEach>
                    </ul>
                </div>
            </c:if>

            <c:choose>
                <c:when test="${user!=null}">
                    <p>Welcome ${user.getFirstName()}!</p>
                    <form method="post" action="Controller?action=LogOut">
                        <p>
                            <input type="submit" id="logoutbutton" value="Log out">
                        </p>
                    </form>
                </c:when>
                <c:otherwise>
                    <form method="post" action="Controller?action=LogIn">
                        <p>
                            <label for="email">Your email </label>
                            <input type="text" class="inputText" id="email" name="email" placeholder="email...">
                        </p>
                        <p>
                            <label for="password">Your password</label>
                            <input type="password" id="password" name="password" placeholder="password...">
                        </p>
                        <p>
                            <input type="submit" id="loginbutton" value="Log in">
                        </p>
                    </form>
                </c:otherwise>
            </c:choose>
            <a href="Controller?action=RegisterPage" class="button">Create account</a>

            <h2>Blog</h2>

            <div class="blogTopic">
                <h3>Waarom had Arne maar 1 op statistiek?</h3>
                <div class="message" id="messages0" style="display:none;"><p class="blogCommentTitle">Comments:</p></div>
                <div class="blogInput">
                    <input type="text" class="inputTextName" id="messageinputName0" placeholder="Name"/>
                    <input type="text" class="inputTextComment" id="messageinputComment0" placeholder="Comment"/>
                    <input class="messageInputRating" type="number" id="messageinputRating0" placeholder="Rating" min="1" max="10"/>
                    <button class="blogSendButton" onclick="send(0);">Comment</button>
                </div>
            </div>

            <div class="blogTopic">
                <h3>Hoe kunt ge nu ni door zijn op BPMN?</h3>
                <div class="message" id="messages1" style="display:none;"><p class="blogCommentTitle">Comments:</p></div>
                <div class="blogInput">
                    <input type="text" class="inputTextName" id="messageinputName1" placeholder="Name"/>
                    <input type="text" class="inputTextComment" id="messageinputComment1" placeholder="Comment"/>
                    <input type="number" class="messageInputRating" id="messageinputRating1" placeholder="Rating" min="1" max="10"/>
                    <button class="blogSendButton" onclick="send(1);">Comment</button>
                </div>
            </div>

            <div class="blogTopic">
                <h3>Welke taal spreekt minecraft:villager?</h3>
                <div class="message" id="messages2" style="display:none;"><p class="blogCommentTitle">Comments:</p></div>
                <div class="blogInput">
                    <input type="text" class="inputTextName" id="messageinputName2" placeholder="Name"/>
                    <input type="text" class="inputTextComment" id="messageinputComment2" placeholder="Comment"/>
                    <input type="number" class="messageInputRating" id="messageinputRating2" placeholder="Rating" min="1" max="10"/>
                    <button class="blogSendButton" onclick="send(2);">Comment</button>
                </div>
            </div>

            <div class="blogTopic">
                <h3>Hoeveel kilometers zitten er in een mijl?</h3>
                <div class="message" id="messages3" style="display:none;"><p class="blogCommentTitle">Comments:</p></div>
                <div class="blogInput">
                    <input type="text" class="inputTextName" id="messageinputName3" placeholder="Name"/>
                    <input type="text" class="inputTextComment" id="messageinputComment3" placeholder="Comment"/>
                    <input type="number" class="messageInputRating" id="messageinputRating3" placeholder="Rating" min="1" max="10"/>
                    <button class="blogSendButton" onclick="send(3);">Comment</button>
                </div>
            </div>

            <div class="blogTopic">
                <h3>Welke java versie gebruikt Arne?</h3>
                <div class="message" id="messages4" style="display:none;"><p class="blogCommentTitle">Comments:</p></div>
                <div class="blogInput">
                    <input type="text" class="inputTextName" id="messageinputName4" placeholder="Name"/>
                    <input type="text" class="inputTextComment" id="messageinputComment4" placeholder="Comment"/>
                    <input type="number" class="messageInputRating" id="messageinputRating4" placeholder="Rating" min="1" max="10"/>
                    <button class="blogSendButton" onclick="send(4);">Comment</button>
                </div>
            </div>

        </main>

        <jsp:include page="footer.jsp">
            <jsp:param name="title" value="Home" />
        </jsp:include>

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/blog.js"></script>

    </body>

</html>