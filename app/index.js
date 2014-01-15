'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');


var MarionetteMannGenerator = module.exports = function MarionetteMannGenerator(args, options, config) {
  yeoman.generators.Base.apply(this, arguments);

  this.on('end', function () {
    // this.installDependencies({ skipInstall: options['skip-install'] });
  });

  this.pkg = JSON.parse(this.readFileAsString(path.join(__dirname, '../package.json')));
};

util.inherits(MarionetteMannGenerator, yeoman.generators.Base);

MarionetteMannGenerator.prototype.askFor = function askFor() {
  var cb = this.async();

  // have Yeoman greet the user.
  console.log(this.yeoman);

  // var prompts = [{
  //   type: 'confirm',
  //   name: 'someOption',
  //   message: 'Would you like to enable this option?',
  //   default: true
  // }];

  var prompts = [{
    name: "moduleName",
    message: "What do you want to call your module?",
    default: "SomeModuleName"
  },
  {
    type: 'confirm',
    name: 'isRoutable',
    message: 'Is this module routable?',
    default: true
  },
  {
    type: "list",
    name: "controllerVerb",
    message: "What verb best describes what your controller does?",
    choices: ["list", "show", "create", "delete"],
    default: "show"
  }
  ]

  this.capitaliseFirstLetter = function(string)
  {
      return string.charAt(0).toUpperCase() + string.slice(1);
  }

  this.prompt(prompts, function (props) {
    this.moduleName = props.moduleName;
    this.isRoutable = props.isRoutable;
    this.controllerVerb = props.controllerVerb;
    this.capitalisedControllerVerb = this.capitaliseFirstLetter(this.controllerVerb);
    cb();
  }.bind(this));
};

MarionetteMannGenerator.prototype.app = function app() {
  this.mkdir(this.moduleName);

  controllerPath = this.moduleName+"/"+this.controllerVerb;
  this.mkdir(controllerPath);
  this.template("controller/_controller.coffee", controllerPath+"/"+this.controllerVerb+"_controller.coffee")
  this.template("controller/_view.coffee", controllerPath+"/"+this.controllerVerb+"_view.coffee")
  this.template('_moduleName_app.coffee', this.moduleName+"/"+this.moduleName+"_app.coffee");
};

MarionetteMannGenerator.prototype.projectfiles = function projectfiles() {
  // this.copy('editorconfig', '.editorconfig');
  // this.copy('jshintrc', '.jshintrc');
};
