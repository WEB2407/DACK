// var Q = require('q');
// var db = require('../config/db');
// var mustache = require('mustache');

// exports.loadAll = function() {

//     var deferred = Q.defer();

//     var sql = 'select * from product';
//     db.load(sql).then(function(rows) {
//         deferred.resolve(rows);
//     });

//     return deferred.promise;
// }

// exports.loadPageByCat = function(id, limit, offset) {

//     var deferred = Q.defer();

//     var promises = [];

//     var view = {
//         id: id,
//         limit: limit,
//         offset: offset
//     };

//     var sqlCount = mustache.render('select count(*) as total from product where MaLoai = {{id}}', view);
//     promises.push(db.load(sqlCount));

//     var sql = mustache.render('select * from product where MaLoai = {{id}} limit {{limit}} offset {{offset}}', view);
//     promises.push(db.load(sql));

//     Q.all(promises).spread(function(totalRow, rows) {
//         var data = {
//             total: totalRow[0].total,
//             list: rows
//         }
//         deferred.resolve(data);
//     });

//     return deferred.promise;
// }

// exports.loadAllByCat = function(id) {

//     var deferred = Q.defer();

//     var sql = 'select * from product where MaLoai = ' + id;
//     db.load(sql).then(function(rows) {
//         deferred.resolve(rows);
//     });

//     return deferred.promise;
// }

var Q = require('q');
var mustache = require('mustache');
var db = require('../config/db');

exports.loadAll = function() {

    var deferred = Q.defer();

   // var sql = 'select * from product order by Time DESC';
    var sql = 'select * from product p, category c, producer pr,image i where pr.MaNSX = p.NSX and p.MaLoai = c.MaLoai and p.MaSP = i.SanPham'
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });
    //console.log()
    return deferred.promise;
}
exports.loadPageByCat = function(id, limit, offset) {

    var deferred = Q.defer();

    var promises = [];

    var view = {
        id: id,
        limit: limit,
        offset: offset
    };

    var sqlCount = mustache.render('select count(*) as total from product where MaLoai = {{id}}', view);
    promises.push(db.load(sqlCount));

    var sql = mustache.render('select * from product where MaLoai = {{id}} limit {{limit}} offset {{offset}}', view);
    promises.push(db.load(sql));

    Q.all(promises).spread(function(totalRow, rows) {
        var data = {
            total: totalRow[0].total,
            list: rows
        }
        deferred.resolve(data);
    });

    return deferred.promise;
}
exports.loadPageByPro = function(id, limit, offset) {

    var deferred = Q.defer();

    var promises = [];

    var view = {
        id: id,
        limit: limit,
        offset: offset
    };

    var sqlCount = mustache.render('select count(*) as total from product where NSX = {{id}}', view);
    promises.push(db.load(sqlCount));

    var sql = mustache.render('select * from product where NSX = {{id}} limit {{limit}} offset {{offset}}', view);
    promises.push(db.load(sql));

    Q.all(promises).spread(function(totalRow, rows) {
        var data = {
            total: totalRow[0].total,
            list: rows
        }
        deferred.resolve(data);
    });

    return deferred.promise;
}
exports.loadAllByCat = function(id) {

    var deferred = Q.defer();

    var sql = 'select * from product where MaLoai = ' + id;
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}

exports.loadDetail = function(id) {

    var deferred = Q.defer();
//select p.TenSP, c.TenLoai from product p, category c
    var sql = 'select * from product p, category c, producer pr,image i where pr.MaNSX = p.NSX and p.MaLoai = c.MaLoai and p.MaSP = i.SanPham and p.MaSP = ' + id;
    db.load(sql).then(function(rows) {
        if (rows) {
            deferred.resolve(rows[0]);
        } else {
            deferred.resolve(null);
        }
    });

    return deferred.promise;
}

// exports.makeCartItem = function(id, q) {

//     var deferred = Q.defer();

//     var sql = 'select * from products where ProID = ' + id;
//     db.load(sql).then(function(rows) {
//         if (rows) {
//             var ret = {
//                 Product: rows[0],
//                 Quantity: q,
//                 Amount: rows[0].Price * q
//             }
//             deferred.resolve(ret);
//         } else {
//             deferred.resolve(null);
//         }
//     });

//     return deferred.promise;
// }