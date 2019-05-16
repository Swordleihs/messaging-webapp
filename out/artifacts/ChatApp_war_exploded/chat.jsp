<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

    <jsp:include page="head.jsp">
        <jsp:param name="title" value="Chat" />
    </jsp:include>

    <body onload="getStatus(); getFriends(); getMessages();">

        <jsp:include page="header.jsp">
            <jsp:param name="title" value="Chat" />
        </jsp:include>

        <main>

            <div id="statusDiv"></div>
            <div id="tableDiv"></div>

            <h3>Change Status</h3>
            <p>
                <input type="text" class="inputText" id="status" placeholder="status..."/>
                <button class="addButton" id="statusButton" onclick="changeStatus()">Change</button>
            </p>

            <h3>Add Friend</h3>
            <p>
                <input class="inputText" type="text" id="newFriend" placeholder="friend id..."/>
                <button class="addButton" id="addFriendButton" onclick="addFriend()">Add</button>
            </p>

            <div id="chat" style="display:none;">
                <div class="chatWindow" id="chatWindow">
                    <div class="chatWindowName" id="chatWindowName"></div>
                    <div class="chatWindowContent" id="chatWindowContent"></div>
                    <input type="text" class="chatWindowInput" id="chatWindowInput" placeholder="type message..." maxlength="30">
                    <button class="chatWindowSendButton" id="chatWindowSendButton">send</button>
                    <input type="hidden" id="receiver" name="receiver"/>
                    <input type="hidden" id="sender" name="sender" value="${user.userId}"/>
                </div>
                <div class="chatWindowNameSmall" id="chatWindowNameSmall"></div>
            </div>

        </main>

        <jsp:include page="footer.jsp">
            <jsp:param name="title" value="Chat - bruh" />
        </jsp:include>

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/status.js"></script>
        <script type="text/javascript" src="js/chat.js"></script>
        <script type="text/javascript" src="js/friends.js"></script>

    </body>
</html>
