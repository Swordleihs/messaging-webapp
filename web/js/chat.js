function getMessages(){
    var sender = $('#sender').val();
    var receiver = $('#receiver').val();

    $.get("Controller?action=GetConversation&sender=" + sender + "&receiver=" + receiver, function(data){
        var contentContainer = $("#chatWindowContent");
        contentContainer.empty();

        $.each(data, function(i, message){
            var p = $("<p></p>").text(message.message);

            if(message.sender == sender){
                $(p).addClass("senderMessage");
            }else{
                $(p).addClass("receiverMessage");
            }

            contentContainer.append(p);

            if(message.sender == sender){
                contentContainer.append($("<br>"));
                contentContainer.append($("<br>"));
            }
        });
        setTimeout(getMessages, 2000);
    })
}

$("#chatWindowSendButton").click(function send(){
    var message = $("#chatWindowInput").val();
    $("#chatWindowInput").val("");
    var senderId = $('#sender').val();
    var receiverId = $('#receiver').val();

    $.ajax({
        type: "POST",
        url: "Controller?action=SendMessage",
        data: {
            "sender": senderId,
            "receiver": receiverId,
            "message": message
        },
        dataType: "json",
        success: function() {
            getMessages();
        },
        error: function(){alert("failed to send message")}
    });
});

$(document).ready(function(){
    $('#chatWindowName').click(function(){
        $('#chatWindow').hide();
        $('#chatWindowNameSmall').show();
    });
});

$(document).ready(function(){
    $('#chatWindowNameSmall').click(function(){
        $('#chatWindow').show();
        $('#chatWindowNameSmall').hide();
    });
});