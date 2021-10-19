$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('.menu li').hover(function(){
      $("ul:not(:animated)", this).slideDown();
    }, function(){
      $("ul.nav_menu", this).slideUp();
    });
  });
});