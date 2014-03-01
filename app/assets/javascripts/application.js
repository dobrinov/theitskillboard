//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require modernizr

//= require timetable

$(document).ready(function(){
  $('.timetable').each(function(){
    var timetable = new Timetable($(this));
  });
});