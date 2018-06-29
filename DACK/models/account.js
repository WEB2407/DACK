var Q = require('q');
var db = require('../config/db');
var mustache = require('mustache');

exports.loadUser = function() {

    var deferred = Q.defer();

    var sql = 'select * from user';
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}

// exports.add = () => {
//    `insert into category(MaLoai, TenLoai) values("{{MaLoai}},{{TenLoai}}")`,
//     return db.insert(sql);
// }
exports.insert = function(entity) {
    var sql = mustache.render(
        `insert into user(TenKH, SDT, Email, DiaChi, Password) values("{{username}}","{{phone}}","{{email}}","{{address}}", "{{password}}")`,
        entity
    );

    return db.insert(sql);
}
exports.login = function(entity) {
    var sql = mustache.render(
            'select * from user where Email = "{{email}}" and Password = "{{password}}"',

        entity
    );

    return db.insert(sql);
}
// exports.delete = (id) => {
//     var sql = mustache.render(
//         `delete from category where MaLoai = ${id}`
//         );
//     return db.insert(sql);
// }