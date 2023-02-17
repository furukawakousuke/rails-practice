let title = "使えるようになったよ"
alert(title);
$(function(){
  $(".jquery").mouseover(function(){
    $(this).css("color","red");
  });
  $('.jquery').mouseout(function(){
    $(this).css("color","gold");
  });
});

$(function(){
  $('.javajava').css({
    'color':'#000000'
  });
  $('.javajava').mouseover(function(){
    $('.javajava').css({'text-decoration':'none'});
  });
});