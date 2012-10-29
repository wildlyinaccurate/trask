window.TaskViewModel = (model) ->
  @editing = ko.observable(false)

  @completed = kb.observable(model, {
    key: 'completed',
    read: (-> return model.completed()),
    write: ((completed) -> model.completed(completed))
  }, @)

  @title = kb.observable(model, {
    key: 'title'
    write: ((title) =>
      if $.trim(title) then model.save(title: $.trim(title)) else _.defer(->model.destroy())
      @editing(false)
    )
  }, @)

  @editEnd = (view_model, event) =>
    @editing(false) if event.keyCode == Trask.Keyboard.ENTER or event.type == 'blur'

  @
