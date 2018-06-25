var express = require('express');
var Q = require('q');
var account = require('../models/account');

var router = express.Router();
router.get('/', function(req, res) {

    res.render('user/sign-up');


    //});
    // category.loadAll().then(function(data) {

    //     res.render('admin/category', {
    //         category: data,
    //     });
    //     console.log(data);
    //     next();
    // });

});

router.post('/', (req, res) => {
     account.insert(req.body).then(value => {
        var vm = {
            showAlert: true
        };
        //res.redirect('/category');
        res.json(req.body);
    console.log(vm);
    alert('hiiiii');
    console.log('succsss');
     }).catch(err => {
         res.end('fail');
    });
});
router.post('/login', (req, res) => {
     account.insert(req.body).then(value => {
        var vm = {
            showAlert: true
        };
        //res.redirect('/category');
        res.json(req.body);
    console.log(vm);
    alert('haaaaaa');
    console.log('succsss');
     }).catch(err => {
         res.end('fail');
    });
});
// router.get('/delete', (req, res, next) => {
//     id = req.query.id;
//     console.log(id);
//     category.delete(id).then(value => {
//         var vm = {
//             showAlert: true
//         };
//         res.redirect('/category');
        
//     }).catch(err => {
//          res.end('fail');
//     });
// });

module.exports = router;