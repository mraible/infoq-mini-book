'use strict';

const browserSync = require('browser-sync');

const config = require('./config.js');

// Run BrowserSync
browserSync({
  server: config.destinationDir,
  port: config.port,
  ui: {
    port: config.uiPort
  },
  files: [
    `${config.destinationDir}/**/*.html`,
  ],
  directory: false
});
