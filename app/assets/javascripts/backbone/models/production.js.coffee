class MastercraftLighting.Models.Production extends Backbone.Model
  paramRoot: 'production'

  defaults:
    name: null
    date: null
    designer: null
    master_electrician: null

class MastercraftLighting.Collections.ProductionsCollection extends Backbone.Collection
  model: MastercraftLighting.Models.Production
  url: '/productions'
