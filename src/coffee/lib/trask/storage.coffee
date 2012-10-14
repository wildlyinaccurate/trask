class Trask.Storage
  constructor: (storageKey) ->
    return new Store('trask-' + storageKey)
