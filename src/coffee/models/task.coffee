class window.Task extends Backbone.RelationalModel
  completed: (completed) ->
    return !! @get('completed') if arguments.length == 0
    @save({completed: if completed then new Date() else null})

Task.setup()
