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
  // Bind custom events
    function music(data){
      console.log(data)
    }
    channels = {}
    var dispatcher = new WebSocketRails("localhost:3000/websocket")
    channels["data-stream"] = dispatcher.subscribe("date-stream")
    channels["data-stream"].bind("music", music) 

  SocketHelpers.initialize(["todo", "user", "notepad"], "localhost:3000/websocket")

  notepadListener = function(){
    $("#notepad").on("input", function(e){
      var $textarea = $(e.currentTarget)
      var text = $textarea.val()
      $.ajax({
        url: "/update_notepad",
        method: "POST",
        data: {
          id: $textarea.attr("notepad"),
          content: text
        },
        success: function(){
          console.log("updated notepad")
        }
      })
      return true
    })
  }()

  authenticateListener = function (){
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
        success: function(){
          window.location.href = "http://localhost:3000/html_root"
        }
      })
    })
  }()

})