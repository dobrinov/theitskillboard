//= require jquery
//= require jquery_ujs
//= require modernizr
//= require functions
//= require module
//= require_tree ./modules/

$().ready(function(){
  window.application = new Application();
});

function Application() {
  this.modules = new Array();
  this.initializeModules();
}

Application.prototype.initializeModules = function(){
  var self = this;

  $('*[data-module][data-js="true"]').each(function(){
    self.modules.push(new window[upperCaseFirstLetter($(this).data('module'))]($(this)));
    $(this).attr('data-module-initialized', true);
  });
}