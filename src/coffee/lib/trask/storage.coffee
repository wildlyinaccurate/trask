class window.TraskStorage
  constructor: (storageKey) ->
    return new Store('trask-' + storageKey)
