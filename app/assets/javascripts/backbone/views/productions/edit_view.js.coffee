MastercraftLighting.Views.Productions ||= {}

class MastercraftLighting.Views.Productions.EditView extends Backbone.View
  template: JST["backbone/templates/productions/edit"]

  events:
    "submit #edit-production": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (production) =>
        @model = production
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
