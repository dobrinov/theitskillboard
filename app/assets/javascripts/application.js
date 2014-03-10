//= require jquery
//= require jquery_ujs
//= require modernizr

//= require timetable
//= require google_analytics

function ready() {
  $('.timetable').each(function(){
    var timetable = new Timetable($(this));
  });
};

$(document).ready(ready);
$(document).ready(doGoogleAnalytics);