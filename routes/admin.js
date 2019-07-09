var express = require('express');
var router = express.Router();
var crypto = require('crypto');
var mysql = require('./../database');
var fs = require('fs');
var markdown = require('markdown');
var marked = require('marked');

var adminHandler = require('./handler/adminHandler.js');

/* GET admin listing. */
router.get('/', adminHandler.index);

router.get('/content', adminHandler.content);

router.get('/login', adminHandler.login);
// Login
router.post('/doLogin', adminHandler.doLogin);

router.get('/aboutme', adminHandler.myInfo);

router.get('/adminList', adminHandler.adminList);

router.get('/adminEdit/:user_id', adminHandler.adminEdit);

router.post('/doAdminUpdate', adminHandler.doAdminUpdate);



router.get('/articlesEdit', adminHandler.articlesEdit);

router.post('/doArticleDelete', adminHandler.doArticleDelete);

router.get('/doArticleEdit/:article_id', adminHandler.doArticleEdit);

router.post('/updateArticlesEdit',adminHandler.updateArticlesEdit);

router.get('/articleAdd', adminHandler.articleAdd);

router.post('/doArticleAdd',adminHandler.doArticleAdd);


router.get('/tagsEdit', adminHandler.tagsEdit);
router.post('/doTagDelete', adminHandler.doTagDelete);
router.get('/doTagEdit/:tag_id', adminHandler.doTagEdit);
router.post('/updateTagsEdit/:tag_id',adminHandler.updateTagsEdit);
router.get('/tagAdd',adminHandler.tagAdd);

router.post('/doTagAdd',adminHandler.doTagAdd);

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
