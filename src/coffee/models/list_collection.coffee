class window.ListCollection extends Backbone.Collection
  model: List
  localStorage: new TraskStorage('lists')
