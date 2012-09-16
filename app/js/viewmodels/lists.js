// Generated by CoffeeScript 1.3.3
(function() {
  var ListViewModel;

  ListViewModel = function(model) {
    var _this = this;
    this.editing = ko.observable(false);
    this.completed = kb.observable(model, {
      key: 'completed',
      read: (function() {
        return model.completed();
      }),
      write: (function(completed) {
        return model.completed(completed);
      })
    }, this);
    this.visible = ko.computed(function() {
      switch (app.viewmodels.settings.list_filter_mode()) {
        case 'active':
          return !_this.completed();
        case 'completed':
          return _this.completed();
        default:
          return true;
      }
    });
    this.title = kb.observable(model, {
      key: 'title',
      write: (function(title) {
        if ($.trim(title)) {
          model.save({
            title: $.trim(title)
          });
        } else {
          _.defer(function() {
            return model.destroy();
          });
        }
        return _this.editing(false);
      })
    }, this);
    this.onDestroyTodo = function() {
      return model.destroy();
    };
    this.onCheckEditBegin = function() {
      if (!_this.editing() && !_this.completed()) {
        _this.editing(true);
        return $('.todo-input').focus();
      }
    };
    this.onCheckEditEnd = function(view_model, event) {
      if ((event.keyCode === 13) || (event.type === 'blur')) {
        $('.todo-input').blur();
        return _this.editing(false);
      }
    };
    return this;
  };

  window.ListsViewModel = function(lists) {
    var _this = this;
    this.lists = kb.collectionObservable(lists, {
      view_model: ListViewModel
    });
    this.lists.collection().bind('change', function() {
      return _this.lists.valueHasMutated();
    });
    return this;
  };

}).call(this);
