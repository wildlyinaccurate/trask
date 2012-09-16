ListViewModel = (model) ->
	# Task UI state
	@editing = ko.observable(false)
	@completed = kb.observable(model, {key: 'completed', read: (-> return model.completed()), write: ((completed) -> model.completed(completed)) }, @)
	@visible = ko.computed(=>
		switch app.viewmodels.settings.list_filter_mode()
			when 'active' then return not @completed()
			when 'completed' then return @completed()
			else return true
	)

	@title = kb.observable(model, {
		key: 'title'
		write: ((title) =>
			if $.trim(title) then model.save(title: $.trim(title)) else _.defer(->model.destroy())
			@editing(false)
		)
	}, @)

	@onDestroyTodo = => model.destroy()

	@onCheckEditBegin = => (@editing(true); $('.todo-input').focus()) if not @editing() and not @completed()
	@onCheckEditEnd = (view_model, event) => ($('.todo-input').blur(); @editing(false)) if (event.keyCode == 13) or (event.type == 'blur')

	@

window.ListsViewModel = (lists) ->
	@lists = kb.collectionObservable(lists, {view_model: ListViewModel})
	@lists.collection().bind('change', => @lists.valueHasMutated())   # get notified of changes to any models

	@
