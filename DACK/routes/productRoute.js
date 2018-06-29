var express = require('express');
var product = require('../models/product');

var productRoute = express.Router();


productRoute.get('/', function(req, res){
    product.loadAll().then(function(data) {

        res.render('admin/product', {
            product: data,
        });
        console.log(data);
        next();
    });

});
productRoute.post('/', (req, res) => {
    // var query = {

    // };
    console.log(req.body);
    product.insert(req.body).then(value => {
        var vm = {
            showAlert: true
        };
        //res.redirect('/category');
        res.json(req.body);
    console.log(vm);
    console.log('succsss');
     }).catch(err => {
         res.end('fail');
    });
});
productRoute.get('/byCat/:id', function(req, res) {
    var rec_per_page = 4;
    var curPage = req.query.page ? req.query.page : 1;
    var offset = (curPage - 1) * rec_per_page;

    product.loadPageByCat(req.params.id, rec_per_page, offset)
        .then(function(data) {

            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = [];
            for (var i = 1; i <= number_of_pages; i++) {
                pages.push({
                    pageValue: i,
                    isActive: i === +curPage
                });
            }

            res.render('user/shop', {
                layoutModels: res.locals.layoutModels,
                product: data.list,
                isEmpty: data.total === 0,
                catId: req.params.id,

                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,
            });
        });
});
productRoute.get('/byPro/:id', function(req, res) {
    var rec_per_page = 4;
    var curPage = req.query.page ? req.query.page : 1;
    var offset = (curPage - 1) * rec_per_page;

    product.loadPageByPro(req.params.id, rec_per_page, offset)
        .then(function(data) {

            var number_of_pages = data.total / rec_per_page;
            if (data.total % rec_per_page > 0) {
                number_of_pages++;
            }

            var pages = [];
            for (var i = 1; i <= number_of_pages; i++) {
                pages.push({
                    pageValue: i,
                    isActive: i === +curPage
                });
            }

            res.render('user/shop', {
                layoutModels: res.locals.layoutModels,
                product: data.list,
                isEmpty: data.total === 0,
                catId: req.params.id,

                pages: pages,
                curPage: curPage,
                prevPage: curPage - 1,
                nextPage: curPage + 1,
                showPrevPage: curPage > 1,
                showNextPage: curPage < number_of_pages - 1,
            });
        });
});
productRoute.get('/detail/:id', function(req, res) {
    product.loadDetail(req.params.id)
        .then(function(pro) {
            if (pro) {
                res.render('user/product-detail', {
                    layoutModels: res.locals.layoutModels,
                    product: pro,
                });
            } else {
                res.redirect('/admin');
            }
            console.log(pro);
        });
});

module.exports = productRoute;