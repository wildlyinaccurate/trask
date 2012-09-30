# Start Trask
$ ->
  window.trask = {
    viewmodels: {},
    collections: {}
  }

  # TODO: Find somewhere meaningful to put this
  trask.ENTER_KEY = 13

  trask.collections.lists = new ListCollection()
  trask.viewmodels.lists = new ListsViewModel(trask.collections.lists)
  trask.viewmodels.settings = new SettingsViewModel()

  ko.applyBindings(trask.viewmodels, $('#trask')[0])

  new AppRouter()
  Backbone.history.start()

  trask.collections.lists.fetch()

# Set up foundation
$ ->
  $(document).foundationAlerts();
  $(document).foundationButtons();
  $(document).foundationAccordion();
  $(document).foundationNavigation();
  $(document).foundationCustomForms();
  $(document).foundationMediaQueryViewer();
  $(document).foundationTabs({callback:$.foundation.customForms.appendCustomMarkup});

  $(document).tooltips();
  $('input, textarea').placeholder();
