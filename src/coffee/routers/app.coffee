class window.AppRouter extends Backbone.Router
  routes:
    '': 'all'

  all: -> trask.viewmodels.settings.list_filter_mode('')
