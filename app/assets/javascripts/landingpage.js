//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require modernizr

//= require google_analytics

function ready() {
};



$(document).ready(ready);
$(document).on('page:load', ready);
$(document).on('page:load', sendGoogleAnalyticsEvents);