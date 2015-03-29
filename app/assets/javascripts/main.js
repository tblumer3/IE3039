$(function() {
    $("#new_period").submit(function(event) {
        event.preventDefault();
        var data = $("#new_period").serialize();
        $.ajax({
            type: "POST",
            url: "/start",
            data: data,
            success: function(data) {
                console.log(data);
                period_started(data);
            },
            error:function(data) {
                return false;
            }
        });
    });

    $(".period_edit").click(function(event) {
      event.preventDefault();
      var id = event.target.id;
      console.log("fuck");
      use_period(id);
    });
});

var period_started = function(data) {
  var enter = $("#enter");
  var exit = $("#exit");
  enter.attr("href", "entry/" + data['id']);
  exit.attr("href", "exit/" + data['id']);
  enter.show();
  exit.show();
};

var use_period = function(id) {
  var enter = $("#enter");
  var exit = $("#exit");
  enter.attr("href", "entry/" + id);
  exit.attr("href", "exit/" + id);
  enter.show();
  exit.show();
};