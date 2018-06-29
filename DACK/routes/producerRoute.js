var express = require('express');
var Q = require('q');
var producer = require('../models/producer');

var router = express.Router();
router.get('/', function(req, res) {

    // res.render('admin/admin', {


    //});
    producer.loadAll().then(function(data) {

        res.render('admin/brand', {
            producer: data,
        });
        console.log(data);
        next();
    });

});

router.post('/', (req, res) => {
	// var query = {

	// };
    console.log(req.body);
    producer.insert(req.body).then(value => {
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
    producer.delete(id).then(value => {
        var vm = {
            showAlert: true
        };
        res.redirect('/category');
        
    }).catch(err => {
         res.end('fail');
    });
});

module.exports = router;