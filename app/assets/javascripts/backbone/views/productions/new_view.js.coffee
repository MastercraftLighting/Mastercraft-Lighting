MastercraftLighting.Views.Productions ||= {}

class MastercraftLighting.Views.Productions.NewView extends Backbone.View
  template: JST["backbone/templates/productions/new"]

  events:
    "submit #new-production": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (production) =>
        @model = production
        window.location.hash = "/#{@model.id}"

      error: (production, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
