var express = require('express');
var Q = require('q');
var admin = require('../models/admin');

var router = express.Router();
router.get('/', function(req, res) {

   
    admin.loadAll().then(function(data) {

        res.render('admin/order', {
            bill: data,
        });
        console.log(data);
        next();
    });

});
module.exports = router;