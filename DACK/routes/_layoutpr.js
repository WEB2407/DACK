var Q = require('q');
//var category = require('../models/category');
var producer = require('../models/producer');

module.exports = function(req, res, next) {
   
    
    if (req.session.isLogged === undefined) {
        req.session.isLogged = false;
    }

    Q.all([
        producer.loadAll()
    ]).spread(function(catlist) {
        res.locals.layoutModels = {
            producer: catlist,
           isLogged: req.session.isLogged,
            curUser: req.session.user,
            // cartSumQ: cart.sumQ(req.session.cart)
        };
        console.log(catlist);

        next();
    });
};

