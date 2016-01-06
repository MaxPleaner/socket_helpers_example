// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require websocket_rails/main
//= require jquery-initialize
//= require socket_helpers
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  SocketHelpers.initialize(["todo", "user"], "socket-helpers-example.herokuapp.com/websocket")
  function authenticateListener(){
    $("form[action='authenticate']").on("submit", function(e){
      e.preventDefault();
      var $form = $(e.currentTarget)
      $.ajax({
        url: "/authenticate",
        method: "POST",
        data: {
          name: $form.find("[name='name']").val(),
          password: $form.find("[name='password']").val()
        },
        success: function(e){
          window.location.href = "http://socket-helpers-example.herokuapp.com/html_root"
        }
      })
    })
  } 
  authenticateListener()
})