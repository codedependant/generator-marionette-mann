@AppName.module "<%= moduleName %>.<%= capitalisedControllerVerb %>", (<%= capitalisedControllerVerb %>, App, Backbone, Marionette, $, _)->


  class <%= capitalisedControllerVerb %>.Controller extends Marionette.Controller

    initialize: (options)->
      {model, region} = options

      view = @getView(model)
      
      region.show(view)


    getView: (model)->
      new <%= capitalisedControllerVerb %>.Item
        model: model