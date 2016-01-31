MastercraftLighting.Views.Productions ||= {}

class MastercraftLighting.Views.Productions.IndexView extends Backbone.View
  template: JST["backbone/templates/productions/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (production) =>
    view = new MastercraftLighting.Views.Productions.ProductionView({model : production})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(productions: @collection.toJSON() ))
    @addAll()

    return this
