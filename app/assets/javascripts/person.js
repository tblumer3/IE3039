$(function() {
    $("#make_person").submit(function(event) {
        event.preventDefault();
        var data = $("#make_person").serialize();
        var url = $("#make_person").attr('action')
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function(data) {
                made_person(data);
            },
            error:function(data) {
                return false;
            }
        });
    });
});


var made_person = function(data) {
    $("#make_person").trigger("reset");
    console.log("You made a person, and it only took a little sex and 9 months of waiting!");
    console.log(data.status.description);
    $('#made_person tr:last').after('<tr><td>'+ data.status.description +'</td><td></td><td>'+ data.status.isFemale +'</td></tr></tr>');
    if ( $('#made_person').is(":hidden") ) {
        $('#made_person').show()
    };
};