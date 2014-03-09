//= require jquery
//= require jquery_ujs
//= require modernizr

//= require google_analytics

function ready() {
};

$(document).ready(ready);
$(document).ready(doGoogleAnalytics);
$(document).on('page:load', ready);
$(document).on('page:load', doGoogleAnalytics);