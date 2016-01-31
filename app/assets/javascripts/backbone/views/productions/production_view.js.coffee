MastercraftLighting.Views.Productions ||= {}

class MastercraftLighting.Views.Productions.ProductionView extends Backbone.View
  template: JST["backbone/templates/productions/production"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
