# Start Trask
$ ->
  Trask.Collections.Lists = new ListCollection()
  Trask.Collections.Lists.fetch()

  Trask.ViewModels.Lists = new ListsViewModel(Trask.Collections.Lists)
  Trask.ViewModels.Settings = new SettingsViewModel()

  ko.applyBindings(Trask.ViewModels, $('#trask')[0])

  Trask.Router = new AppRouter()
  Backbone.history.start()


# Set up foundation
$ ->
  $(document).foundationAlerts()
  $(document).foundationButtons()
  $(document).foundationAccordion()
  $(document).foundationNavigation()
  $(document).foundationCustomForms()
  $(document).foundationMediaQueryViewer()
  $(document).foundationTabs({callback:$.foundation.customForms.appendCustomMarkup})

  $(document).tooltips()
  $('input, textarea').placeholder()
