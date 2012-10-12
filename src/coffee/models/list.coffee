class window.List extends Backbone.RelationalModel
  relations: [{
    type: Backbone.HasMany
    key: 'tasks'
    relatedModel: 'Task'
    reverseRelation:
      key: 'belongsTo'
  }]

List.setup()
