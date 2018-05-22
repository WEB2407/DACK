var express = require('express');
var Q = require('q');
var admin = require('../models/admin');

var router = express.Router();
router.get('/', function(req, res) {

    // res.render('admin/admin', {


    //});
    admin.loadAll().then(function(data) {

        res.render('admin/admin', {
            bill: data,
        });
        console.log(data);
        next();
    });

});
module.exports = router;