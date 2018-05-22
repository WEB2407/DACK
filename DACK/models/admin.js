var Q = require('q');
var db = require('../config/db');

exports.loadAll = function() {

    var deferred = Q.defer();

    var sql = 'select * from bill';
    db.load(sql).then(function(rows) {
        deferred.resolve(rows);
    });

    return deferred.promise;
}