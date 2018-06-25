var express = require('express');
var Q = require('q');
var category = require('../models/category');

var router = express.Router();
router.get('/', function(req, res) {

    // res.render('admin/admin', {


    //});
    category.loadAll().then(function(data) {

        res.render('admin/category', {
            category: data,
        });
        console.log(data);
        next();
    });

});

router.post('/', (req, res) => {
	// var query = {

	// };
    console.log(req.body);
    category.insert(req.body).then(value => {
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
router.get('/delete', (req, res, next) => {
    id = req.query.id;
    console.log(id);
    category.delete(id).then(value => {
        var vm = {
            showAlert: true
        };
        res.redirect('/category');
        
    }).catch(err => {
         res.end('fail');
    });
});

module.exports = router;