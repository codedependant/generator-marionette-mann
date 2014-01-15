@AppName.module "<%= moduleName %>.<%= capitalisedControllerVerb %>", (<%= capitalisedControllerVerb %>, App, Backbone, Marionette, $, _)->

  class <%= capitalisedControllerVerb %>.Item extends Marionette.ItemView
    template: "itemViewTemplate"

    ui:
      testButton: ".js-test-button"

    events:
      "click @ui.testButton" : "clickedTestButton"

    clickedTestButton: (event)->
      console.log "clicked test button"