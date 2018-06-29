var Q = require('q');
var mustache = require('mustache');
var db = require('../config/db');

exports.loadAll = function() {

    var deferred = Q.defer();

   // var sql = 'select * from product order by Time DESC';
    var sql = 'select * from product p, category c, producer pr where pr.MaNSX = p.NSX and p.MaLoai = c.MaLoai'
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });
    //console.log()
    return deferred.promise;
}
exports.loadNew = function() {

    var deferred = Q.defer();

   // var sql = 'select * from product order by Time DESC';
    var sql = 'select * from product order by NgayThemSP desc limit 12'
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });
    //console.log()
    return deferred.promise;
}

exports.loadHot = function() {

    var deferred = Q.defer();

   var sql = 'select * from product order by LuotXem desc limit 12';
//     var sql = 'select *'+
// 'from product, (select product.MaSP, billdetail.SoLuong'+
//                'from product, billdetail'+
//                'where product.MaSP = billdetail.MaSP'+
//                'group by product.MaSP'+
//                'order by SUM(billdetail.SoLuong) desc'+
//                'limit 12) as temp'+
// 'where product.MaSP = temp.MaSP'
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
    var sql = 'select * from product p, category c, producer pr where pr.MaNSX = p.NSX and p.MaLoai = c.MaLoai and p.MaSP = ' + id;
    db.load(sql).then(function(rows) {
        if (rows) {
            deferred.resolve(rows[0]);
        } else {
            deferred.resolve(null);
        }
    });

    return deferred.promise;
}

exports.insert = function(entity) {
    var sql = mustache.render(
        `insert into product(MaSP, TenSP, Gia, MoTa, MaLoai, NSX, SoLuong) values("{{code}}","{{nameproduct}}", "{{price}}", "{{textareainput}}", "{{category}}", "{{producer}}", "{{quality}}")`,
        entity
    );

    return db.insert(sql);
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