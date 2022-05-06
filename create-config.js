#!/usr/bin/env node
// Ghost Configuration for Heroku

var fs = require('fs');
var path = require('path');
var url = require('url');

var appRoot = process.env.GHOST_INSTALL

function createConfig() {
  config = {
    url: process.env.PUBLIC_URL || "https://withzombies-blog.herokuapp.com/",
    logging: {
      level: "info",
      transports: ["stdout"]
    },
    mail: {
      transport: 'SMTP',
      options: {
        service: 'Mailgun',
        auth: {
          user: process.env.MAILGUN_SMTP_LOGIN,
          pass: process.env.MAILGUN_SMTP_PASSWORD
        }
      }
    },
    fileStorage: true,
    storage: {
    },
    database: {
      client: 'mysql',
      connection: getMysqlConfig(process.env.JAWSDB_URL),
      pool: { min: 0, max: 5 },
      debug: false
    },
    server: {
      host: '0.0.0.0',
      port: process.env.PORT
    },
    paths: {
      contentPath: process.env.GHOST_CONTENT
    }
  };

  return config;
}

function getMysqlConfig(connectionUrl) {
  if (connectionUrl == null) {
    return {};
  }

  var dbConfig = url.parse(connectionUrl);
  if (dbConfig == null) {
    return {};
  }

  var dbAuth = dbConfig.auth ? dbConfig.auth.split(':') : [];
  var dbUser = dbAuth[0];
  var dbPassword = dbAuth[1];

  if (dbConfig.pathname == null) {
    var dbName = 'ghost';
  } else {
    var dbName = dbConfig.pathname.split('/')[1];
  }

  var dbConnection = {
    host: dbConfig.hostname,
    port: dbConfig.port || '3306',
    user: dbUser,
    password: dbPassword,
    database: dbName
  };
  return dbConnection;
}

var configContents = JSON.stringify(createConfig(), null, 2);
fs.writeFileSync(path.join(appRoot, 'config.production.json'), configContents);
console.log(configContents)
console.log(path.join(appRoot, 'config.production.json'))
