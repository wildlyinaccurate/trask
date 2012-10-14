class window.List extends Backbone.RelationalModel
  relations: [{
    type: Backbone.HasMany
    key: 'tasks'
    relatedModel: 'Task'
    collectionType: 'TaskCollection'
    reverseRelation:
      key: 'belongsTo'
  }]

  defaults: -> return {
    created_at: new Date()
  }

List.setup()
