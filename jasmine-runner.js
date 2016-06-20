var jasmine = require("jasmine");
var JSONReporter = require("jasmine-json-test-reporter");
var jrunner = new jasmine;

jrunner.configureDefaultReporter({print: function() {};});  // remove default reporter logs
jasmine.getEnv().addReporter(new JSONReporter({  // add jasmine-spec-reporter
  file: "results.json",
  beautify: true,
  indentationLevel: 4
}));
jrunner.loadConfigFile();  // load jasmine.json configuration
jrunner.execute();
