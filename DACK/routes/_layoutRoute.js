var Q = require('q');
var category = require('../models/category');
 var producer = require('../models/producer');
//var cart = require('../models/cart');



module.exports = function(req, res, next) {
    category.loadAll().then(function(data) {
        res.locals.hangbag = data;
        console.log(data);
        // res.locals.layoutModels = {
        //     hangbag: data
        // };
        next();
    });
    //console.log('hiii');
    //console.log(category.loadBalo());
};

// module.exports = function(req, res, next) {
//     producer.loadAll().then(function(data) {
//         //res.locals.hangbag = data;
//         res.locals.layoutModels = {
//             producer: data
//         };
//         next();
//     });
//     //console.log('hiii');
//     //console.log(category.loadBalo());
// };
// module.exports = function(req, res, next) {
//     category.loadHangBag().then(function(data) {
//          res.locals.categories = data;
//         //res.locals.layoutModels = {
//         //	hangbag: data
//         //};
//         console.log(data);
//             console.log('hiii');

//           //  console.log(category.loadBalo());

//         next();
//     });
    
//     // if (req.session.isLogged === undefined) {
//     //     req.session.isLogged = false;
//     // }

//     // Q.all([
//     //     category.loadAll()
//     // ]).spread(function(catList) {
//     //     res.locals.layoutModels = {
//     //         category: catList,
//     //        // isLogged: req.session.isLogged,
//     //         //curUser: req.session.user,
//     //         //cartSumQ: cart.sumQ(req.session.cart)
//     //     };
//     //     console.log(catlist);

//     //     next();
//     // });
// };

