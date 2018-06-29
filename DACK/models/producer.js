var Q = require('q');
var db = require('../config/db');
var mustache = require('mustache');

exports.loadAll = function() {

    var deferred = Q.defer();

    var sql = 'select * from producer';
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}
exports.loadLimit = function(){
	var deferred = Q.defer();
	var sql = 'select * from product where NSX = {{id}} limit 3'
	db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}
exports.insert = function(entity) {
    var sql = mustache.render(
        `insert into producer(MaNSX, TenNSX) values("{{code}}","{{name}}")`,
        entity
    );

    return db.insert(sql);
}
exports.delete = (id) => {
    var sql = mustache.render(
        `delete from producer where MaNSX = ${id}`
        );
    return db.insert(sql);
}