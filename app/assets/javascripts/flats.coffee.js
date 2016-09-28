document.addEventListener("turbolinks:load", function() {

    $("tr[data-link]").click(function() {
        window.location = $(this).data('link');
    });
    $("tr[data-link]").hover(function() {
        $(this).css("background-color", "#F2F2F2");
    }, function() {
        $(this).css("background-color", "white");
    });
});
