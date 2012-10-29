class Trask.Storage extends Store
  constructor: (storageKey) ->
    return super('trask-' + storageKey)
