function Logo(node) {
  Module.call(this, node);
}

Logo.prototype = Object.create(Module.prototype, {
  addEventListeners: {
    value: function(){

      Module.prototype.addEventListeners.apply(this, arguments);
    }
  }
});