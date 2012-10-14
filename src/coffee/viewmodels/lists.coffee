ListViewModel = (model) ->
  @editing = ko.observable(false)
  @newTaskTitle = ko.observable('')

  @title = kb.observable(model, {
    key: 'title'
    write: ((title) =>
      if $.trim(title) then model.save(title: $.trim(title)) else _.defer(->model.destroy())
      @editing(false)
    )
  }, @)

  @tasks = kb.collectionObservable(model.get('tasks'))

  @editBegin = =>
    $('input').focus()
    @editing(true)

  @editEnd = =>
    return if event.keyCode != Trask.Keyboard.ENTER
    @editing(false)

  @createTask = (view_model, event) =>
    return if not $.trim(@newTaskTitle()) or event.keyCode != Trask.Keyboard.ENTER

    newTask = @tasks.collection().create({
      title: $.trim(@newTaskTitle())
      belongsTo: model.get('id')
    })

    model.get('tasks').add(newTask)

    Backbone.sync('update', model, {
      success: => @newTaskTitle('')
    })

  @slug = ko.computed(=>
    @title().toLowerCase()
      .replace(/\ /g,'-')
      .replace(/[^\w-]+/g,'')
  )

  @

window.ListsViewModel = (lists) ->
  @title = ko.observable('')

  @lists = kb.collectionObservable(lists, {
    view_model: ListViewModel
  })

  @lists.collection().bind('change', => @lists.valueHasMutated())

  @createList = (view_model, event) =>
    return true if not $.trim(@title()) or (event.keyCode != Trask.Keyboard.ENTER)

    lists.create({
      title: $.trim(@title())
      tasks: new TaskCollection()
    })

    @title('')

  @
