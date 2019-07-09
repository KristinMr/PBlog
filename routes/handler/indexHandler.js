var indexHandler = {};
var crypto = require('crypto');
var mysql = require('./../../database');
var fs = require('fs');
var markdown = require('markdown');
var marked = require('marked');

indexHandler.index = function (req, res) {
    res.render('forestage/index');
}

indexHandler.home = function (req, res) {
    // var fileDirectory = './public/articles/';
    // var query = 'select * from article';
    // mysql.query(query, function (err, rows) {
    //     if (err) {
    //         console.log(err);
    //         return;
    //     } else {
    //         rows.sort(function (a, b) {
    //             return (new Date(b.rows.article_date)) - (new Date(a.row.article_date));
    //         });
    //         var totalArticles = rows.length;
    //         var perPage = 5;
    //         var currentPage = 1;
    //         var articleIndex = (currentPage - 1) *perPage;
    //         var perPageDatas = rows.slice(articleIndex, articleIndex + perPage);
    //         var totalPage;
    //         if (totalArticles % perPage === 0) {
    //             totalPage = totalArticles / perPage;
    //         } else {
    //             totalPage = (totalArticles - totalArticles % perPage) / perPage + 1;
    //         }
    //         var filenames = [];
    //         var perPageFiles = [];
    //         var result = {};
    //         if (currentPage < 1 || currentPage > totalPage) {
    //             res.status(404).send('Not Found!');
    //         }else {
    //             if (fs.existsSync(fileDirectory)) {
    //                 fs.readir(fileDirectory, function (err, files) {
    //                     if (err) {
    //                         console.log(err);
    //                         return;
    //                     }
    //                     files.forEach(function (filename, index) {
    //                         filenames.push(filename.split('.md')[0]);
    //                     });
    //                     filenames.sort(function (a, b) {
    //                         return b - a;
    //                     });
    //                     perPageFiles = filenames.slice(articleIndex, articleIndex + perPage);
    //                     var completedCount = 0;
    //                     perPageFiles.forEach(function (filename, index) {
    //                         fs.readFile(fileDirectory + filename + 'md', 'utf-8', function (err, data) {
    //                             if (err) {
    //                                 console.log(err);
    //                                 return;
    //                             } else {
    //                                 perPageDatas[index].articleContent = data.split('<!--more-->')[0];
    //                                 completedCount++;
    //                                 if (completedCount === perPageFiles.length) {
    //                                     result.count = totalArticles;
    //                                     result.data = perPageDatas;
    //                                     result.ret = true;
    //                                     res.send(result);
    //                                 }
    //                             }
    //                         });
    //                     });
    //                 });
    //             } else {
    //                 console.log(fileDirectory + "Not Found!");
    //                 return;
    //             }
    //         }
    //     }
    // })


    var query = 'select * from article';
    mysql.query(query, function (err, rows, fields) {
        if (err) {
            console.log(err);
            return;
        } else {
            var article_data = {};
            var articles_data = new Array();

            for (var i = 0; i < rows.length; i++) {
                var articleName = './public/articles/' + rows[i].article_id + '.md';
                fs.readFile(articleName, function(err, data){
                    if(err){
                        console.log("文件不存在！");
                        res.send("文件不存在！");
                    }else{
                        // console.log(data);
                        htmlStr = marked(data.toString());
                        article_data = htmlStr;
                        articles_data[i] = article_data;
                        console.log(articles_data);
                    }
                });
            }
            res.render('forestage/index.ejs', {articles: rows, doc: articles_data});
        }
    });

}

indexHandler.about = function (req, res) {
    fs.readFile('./public/aboutme.md', function(err, data){
        if(err){
            console.log("文件不存在！");
            res.send("文件不存在！");
        }else{
            console.log(data);
            htmlStr = marked(data.toString());
            res.render('forestage/about.ejs', {doc: htmlStr});
        }
    });
}


module.exports = indexHandler;