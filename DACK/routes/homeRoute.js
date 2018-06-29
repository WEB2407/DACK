var express = require('express');
var Q = require('q');
var product = require('../models/product');

var router = express.Router();
router.get('/', function(req, res) {

    // res.render('admin/admin', {


    //});
    product.loadNew().then(function(data) {

        res.render('user/index', {
            productnew: data,
        });
        console.log(data);
        next();
    });

});
module.exports = router;