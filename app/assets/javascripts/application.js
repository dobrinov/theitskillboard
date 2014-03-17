//= require jquery
//= require jquery_ujs
//= require jquery.easing.1.3
//= require modernizr

//= require timetable
//= require skill-bar
//= require google_analytics

function ready() {
  $('.timetable').each(function(){
    var timetable = new Timetable($(this));
  });
};

$(document).ready(ready);
$(document).ready(doGoogleAnalytics);