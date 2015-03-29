var ready = function() {
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


    $("#end_period").click(function(event) {
        console.log("well I'll fuck a goat for christmas");
        event.preventDefault();
        var url = $("#end_period").attr('href');
        $.ajax({
            type: "POST",
            url: url,
            success: function(data) {
                end_session(data);
            },
            error:function(data) {
                return false;
            }
        });
    });
};


var made_person = function(data) {
    $("#make_person").trigger("reset");
    console.log("You made a person, and it only took a little sex and 9 months of waiting!");
    console.log(data.status.description);
    $('#made_person tr:first').after('<tr><td>'+ data.status.description +'</td><td>'+ data.status.isFemale +'</td><td>'+ data.status.entry_time +'</td></tr>');
    if ( $('#made_person').is(":hidden") ) {
        $('#made_person').show()
    };
};


var end_session = function(data) {
    console.log(data);
};

var stop_person = function(data) {
    console.log("tits and shits");
};


$(document).ready(ready);
$(document).on('page:load', ready);
