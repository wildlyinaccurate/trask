ListViewModel = (model) ->
  @title = kb.observable(model, {
    key: 'title'
    write: ((title) =>
      if $.trim(title) then model.save(title: $.trim(title)) else _.defer(->model.destroy())
      @editing(false)
    )
  }, @)

  @newTaskTitle = ko.observable('')

  @tasks = new kb.collectionObservable(new TaskCollection())

  @createTask = (view_model, event) =>
    return true if not $.trim(@newTaskTitle()) or (event.keyCode != trask.ENTER_KEY)

    @tasks.collection().create({title: $.trim(@newTaskTitle())})
    @newTaskTitle('')


  @slug = ko.computed(=>
    @title().toLowerCase()
      .replace(/\ /g,'-')
      .replace(/[^\w-]+/g,'')
  )

  @

window.ListsViewModel = (lists) ->
  @title = ko.observable('')

  @lists = kb.collectionObservable(lists, {view_model: ListViewModel})
  @lists.collection().bind('change', => @lists.valueHasMutated())

  @createList = (view_model, event) =>
    return true if not $.trim(@title()) or (event.keyCode != trask.ENTER_KEY)

    lists.create({title: $.trim(@title())})
    @title('')

  @
