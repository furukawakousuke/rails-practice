let title = "使えるようになったよ"
alert(title);
$(function(){
  $(".jquery").on('click',function(){
    $(this).css("color","red");
  });
});