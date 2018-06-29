var Q = require('q');
var db = require('../config/db');
var mustache = require('mustache');


exports.loadAll = function() {

    var deferred = Q.defer();

    var sql = 'select * from category';
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}

exports.loadLimit = function(){
    var deferred = Q.defer();
    var sql = 'select * from product where MaLoai = {{cat}} limit 3'
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}
exports.insert = function(entity) {
    var sql = mustache.render(
        `insert into category(MaLoai, TenLoai) values("{{code}}","{{namecategory}}")`,
        entity
    );

    return db.insert(sql);
}
exports.delete = (id) => {
    var sql = mustache.render(
        `delete from category where MaLoai = ${id}`
        );
    return db.insert(sql);
}