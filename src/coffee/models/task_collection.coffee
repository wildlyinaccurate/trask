class window.TaskCollection extends Backbone.Collection
  model: Task
  localStorage: new Trask.Storage('tasks')
