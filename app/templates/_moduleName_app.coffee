@AppName.module "<%= moduleName %>", (<%= moduleName %>, App, Backbone, Marionette, $, _)->

  class <%= moduleName %>.Router extends Marionette.AppRouter
    appRoutes:
      "<%= moduleName %>/<%= controllerVerb %>" : "<%= controllerVerb %><%= capitalisedItemName %>"


  API = 
    <%= controllerVerb %><%= capitalisedItemName %>: (options={})->

      if typeof options is "string"
        # navigated to this module via backbone history
        id = options
        model = modelCollection.findWhere(id: id)
      else
        # navigated to this module via an event
        {model, region} = options
        App.navigate "<%= moduleName %>/<%= controllerVerb %>"

      region = App.mainRegion

      new <%= moduleName %>.<%= capitalisedControllerVerb %>.Controller
        model:  model
        region: region


  App.addInitializer ->
    new <%= moduleName %>.Router
      controller: API

  App.commands.setHandler "app:<%= itemName %>:<%= controllerVerb %>", (options={})->
    {model, region} = options
    API.<%= controllerVerb %><%= capitalisedItemName %>
      model:  model
      region: region
