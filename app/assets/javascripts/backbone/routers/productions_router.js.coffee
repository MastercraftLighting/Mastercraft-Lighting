class MastercraftLighting.Routers.ProductionsRouter extends Backbone.Router
  initialize: (options) ->
    @productions = new MastercraftLighting.Collections.ProductionsCollection()
    @productions.reset options.productions

  routes:
    "new"      : "newProduction"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newProduction: ->
    @view = new MastercraftLighting.Views.Productions.NewView(collection: @productions)
    $("#productions").html(@view.render().el)

  index: ->
    @view = new MastercraftLighting.Views.Productions.IndexView(collection: @productions)
    $("#productions").html(@view.render().el)

  show: (id) ->
    production = @productions.get(id)

    @view = new MastercraftLighting.Views.Productions.ShowView(model: production)
    $("#productions").html(@view.render().el)

  edit: (id) ->
    production = @productions.get(id)

    @view = new MastercraftLighting.Views.Productions.EditView(model: production)
    $("#productions").html(@view.render().el)
