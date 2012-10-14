class window.AppRouter extends Backbone.Router
  routes:
    '*actions': 'defaultRoute'

  defaultRoute: (action) ->
    Trask.ViewModels.Settings.list_filter_mode('')
