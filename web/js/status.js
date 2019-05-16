var getStatusRequest = new XMLHttpRequest();
var changeStatusRequest = new XMLHttpRequest();

function changeStatus() {
    updateStatus();
    setTimeout("getStatus()", 2000);
}

function getStatus () {
    getStatusRequest.open("GET","Controller?action=GetStatus",true);
    getStatusRequest.onreadystatechange=getStatusData;
    getStatusRequest.send(null);
}

function getStatusData () {
    if(getStatusRequest.status == 200){
        if(getStatusRequest.readyState == 4){

            var responseText = JSON.parse(getStatusRequest.responseText);
            var status = responseText.status;

            var statusDiv = document.getElementById("statusDiv");
            var statusParagraph = statusDiv.childNodes[0];

            if(statusParagraph == null)
            {
                statusParagraph = document.createElement('p');
                statusParagraph.id = "statusText";
                var statusText = document.createTextNode(status);
                statusParagraph.appendChild(statusText);
                statusDiv.appendChild(statusParagraph);
            }
            else
            {
                var statusText = document.createTextNode(status);
                statusParagraph.removeChild(statusParagraph.childNodes[0]);
                statusParagraph.appendChild(statusText);
            }
        }
    }
}

function updateStatus(){
    var statusText = document.getElementById("status").value;
    document.getElementById("status").value = "";
    var data = "status=" + encodeURIComponent(statusText);
    changeStatusRequest.open("POST","Controller?action=UpdateStatus",true);
    changeStatusRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    changeStatusRequest.send(data);
}



function startConversation(){
        $('#chat').show();
        $('#chatWindowNameSmall').hide();
        $('#chatWindow').show();
        var receiverId = this.id;
        var receiver = document.getElementById("receiver");
        var tr = document.getElementById(receiverId);
        var receiverName = tr.childNodes[0].textContent;
        receiver.setAttribute("value", receiverId.toString());
        document.getElementById("chatWindowName").innerText = receiverName;
        document.getElementById("chatWindowNameSmall").innerText = receiverName;
}
