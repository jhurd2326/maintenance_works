$( document ).on('turbolinks:load', function() {
  $("#info-message").hide().fadeIn(800);
})

var fade_out = function() {
  $("#info-message").fadeOut(400);
}
setTimeout(fade_out, 3000);
