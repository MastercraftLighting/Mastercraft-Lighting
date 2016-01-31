MastercraftLighting.Views.Productions ||= {}

class MastercraftLighting.Views.Productions.ShowView extends Backbone.View
  template: JST["backbone/templates/productions/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
