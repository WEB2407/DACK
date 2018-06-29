var Q = require('q');
var category = require('../models/category');
 var producer = require('../models/producer');
 var product = require('../models/product');
//var cart = require('../models/cart');



module.exports = function(req, res, next) {
    category.loadAll().then(function(data) {
        res.locals.hangbag = data;
        console.log(data);
        
        next();
    });
    //console.log('hiii');
    //console.log(category.loadBalo());
};


module.exports = function(req, res, next) {
    product.loadHot().then(function(data) {
        res.locals.producthot = data;
       
        next();
    });
    //console.log('hiii');
    //console.log(category.loadBalo());
};

