//= require jquery
//= require jquery_ujs
//= require modernizr
//= require_tree .

$().ready(function(){
  window.application = new Application();
});

function Application() {
  this.modules = new Array();
  this.initializeModules();
}

Application.prototype.initializeModules = function(){
  // TODO: Should also initialize new modules on DOM change

  var self = this;

  $('*[data-module][data-js="true"]').each(function(){
    self.modules.push(new window[upperCaseFirstLetter($(this).data('module'))]($(this)));
    $(this).attr('data-module-initialized', true);
  });
}