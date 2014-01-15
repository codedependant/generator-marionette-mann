@AppName.module "<%= moduleName %>.<%= capitalizedControllerVerb %>", (<%= capitalizedControllerVerb %>, App, Backbone, Marionette, $, _)->


  class <%= capitalizedControllerVerb %>.Controller extends Marionette.Controller

    initialize: (options)->
      {model, region} = options
      view = @getView(model)
      region.show(view)


    getView: (model)->
      new <%= capitalizedControllerVerb %>.Item
        model: model