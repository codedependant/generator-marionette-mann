@AppName.module "<%= moduleName %>", (<%= moduleName %>, App, Backbone, Marionette, $, _)->

  class <%= moduleName %>.Router extends Marionette.AppRouter
    appRoutes:
      "items" : "<%= controllerVerb %>"


  API = 
    <%= controllerVerb %>: (items)->
      new <%= moduleName %>.<%= capitalizedControllerVerb %>.Controller
        items: items


  App.addInitializer ->
    new <%= moduleName %>.Router
      controller: API

  App.commands.setHandler "items:<%= controllerVerb %>", (options={})->
    API.<%= controllerVerb %> options.items