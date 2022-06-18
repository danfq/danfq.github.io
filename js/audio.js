$(document).on('click', '.toggle-sound', function(e) {
    $(this).toggleClass('sound-mute');

    //Toggle Audio
    if ($(this).hasClass("sound-mute")) {

        //Mute Audio
        document.getElementById("audio").pause();

    } else {

        //Play Audio
        document.getElementById("audio").play();

    }

});