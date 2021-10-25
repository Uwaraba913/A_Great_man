$(document).on('turbolinks:load', function() {
  var cursor=$("#cursor");
  $(document).on("mousemove",function(e){
    var x=e.clientX;
    var y=e.clientY;
    console.log("x:"+x)
    console.log("y:"+y)
    cursor.css({
      "opacity":"1",
      "top":y+"px",
      "left":x+"px"
    });
  });
});