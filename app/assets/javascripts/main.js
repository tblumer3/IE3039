$(function() {
    $("#new_session").submit(function(event) {
        event.preventDefault();
        var data = $("#new_session").serialize();
        $.ajax({
            type: "POST",
            url: "/start",
            data: data,
            success: function(data) {
                console.log(data);
                session_started(data);
            },
            error:function(data) {
                return false;
            }
        });
    });
});

var session_started = function(data) {
  var enter = $("#enter");
  var exit = $("#exit");
  enter.attr("href", "entry/" + data['id'])
  exit.attr("href", "exit/" + data['id'])
  enter.show();
  exit.show();
};

    