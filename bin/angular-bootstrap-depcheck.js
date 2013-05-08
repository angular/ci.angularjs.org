#!/usr/local/bin/node

// checks if angularui-bootstrap project uses only approved dependencies
// if bad dependencies are found, remove them from package.json for npm install

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
  'grunt-html2js',
  'grunt-karma'
];

 
fs.readFile(file, 'utf8', function (err, data) {
  if (err) {
    console.log('Error: ' + err);
    return;
  }
 
  data = JSON.parse(data);

  Object.keys(data.devDependencies).forEach(function(dependency) {
    if (ALLOWED_DEPENDENCIES.indexOf(dependency) === -1) {
      console.log('Unauthorized dependency found: ' + dependency + '. Not installing dependency.');
      //Delete bad dependencies
      delete data.devDependencies[dependency];
    }
  });

  fs.writeFileSync(file, JSON.stringify(data));
 
  console.log('Dependency check succeeded!');
});

