#!/usr/local/bin/node

// checks if angularui-bootstrap project uses only approved dependencies
// so that we can safely do npm install during the build and let
// them manage version numbers of their dependencies

var fs = require('fs');
var file = __dirname + '/../JenkinsHome/workspace/angularui-bootstrap/package.json';
var ALLOWED_DEPENDENCIES = [
  'node-markdown',
  'grunt',
  'grunt-contrib-concat', 
  'grunt-contrib-copy',
  'grunt-contrib-jshint',
  'grunt-contrib-uglify',
  'grunt-contrib-watch',
  'grunt-conventional-changelog',
  'grunt-html2js'
];

 
fs.readFile(file, 'utf8', function (err, data) {
  if (err) {
    console.log('Error: ' + err);
    return;
  }
 
  data = JSON.parse(data);

  Object.keys(data.devDependencies).forEach(function(dependency) {
    if (ALLOWED_DEPENDENCIES.indexOf(dependency) === -1) {
      throw new Error('Unauthorized dependency found: ' + dependency);
    };
  });
 
  console.log('Dependency check succeeded!');
});

