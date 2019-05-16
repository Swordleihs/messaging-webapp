var getFriendsRequest = new XMLHttpRequest();
var addFriendRequest = new XMLHttpRequest();

function getFriends(){
    getFriendsRequest.open("GET","Controller?action=GetFriends",true);
    getFriendsRequest.onreadystatechange=getFriendsData;
    getFriendsRequest.send(null);
}

function getFriendsData () {
    if (getFriendsRequest.status == 200) {
        if (getFriendsRequest.readyState == 4) {

            var responseText = JSON.parse(getFriendsRequest.responseText);
            var friends = responseText.friends;

            var tableDiv = document.getElementById("tableDiv");
            var tableO = tableDiv.childNodes[0];

            if (tableO != null) {
                tableDiv.removeChild(tableO);
            }

            var table = document.createElement("table");
            var tableHead = document.createElement("tr");

            var tableHeadName = document.createElement("th");
            var tableHeadNameText = document.createTextNode('name');

            var tableHeadStatus = document.createElement("th");
            var tableHeadStatusText = document.createTextNode('status');

            tableHeadName.appendChild(tableHeadNameText);
            tableHeadStatus.appendChild(tableHeadStatusText);

            tableHead.appendChild(tableHeadName);
            tableHead.appendChild(tableHeadStatus);

            table.appendChild(tableHead);
            tableDiv.appendChild(table);

            for (var i = 0; i < friends.length; i++) {
                var tableRow = document.createElement('tr');
                var name = document.createElement('td');
                var nameText = document.createTextNode(friends[i].name);
                name.appendChild(nameText);

                var status = document.createElement('td');
                var statusText = document.createTextNode(friends[i].status);
                status.appendChild(statusText);

                tableRow.appendChild(name);
                tableRow.appendChild(status);
                tableRow.setAttribute("id", friends[i].id);
                tableRow.addEventListener("click", startConversation);

                table.appendChild(tableRow);
                tableDiv.appendChild(table);
            }
            setTimeout("getFriends()", 5000);
        }
    }
}

function addFriend(){
    var idText = document.getElementById("newFriend").value;
    document.getElementById("newFriend").value = "";
    var data = "id=" + encodeURIComponent(idText);
    addFriendRequest.open("POST","Controller?action=AddFriend",true);
    addFriendRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    addFriendRequest.send(data);
}