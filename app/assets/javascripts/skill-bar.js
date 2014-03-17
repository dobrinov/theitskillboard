$(document).ready(function(){
  $('.skill-bar').each(function(){
    var level = $(this).find('.skill-bar__level');
    var original_width = level.width();
    level.width(0);

    level.animate(
      { width: original_width },
      { duration: 1500, easing: 'easeInOutCirc' }
    );
  });
});