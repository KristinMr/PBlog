var express = require('express');
var router = express.Router();
var crypto = require('crypto');
var mysql = require('./../database');
var fs = require('fs');
var markdown = require('markdown');
var marked = require('marked');

var indexHandler = require('./handler/indexHandler.js');

/* GET home page. */
router.get('/', indexHandler.home);


/* GET home page. */
router.get('/kris', function(req, res, next) {
  res.render('./backstage/login.ejs');
});

router.get('/about',indexHandler.about);



marked.setOptions({
    renderer: new marked.Renderer(),
    gfm: true,
    tables: true,
    breaks: false,
    pedantic: false,
    sanitize: true,
    smartLists: true,
    smartypants: false
});

module.exports = router;
