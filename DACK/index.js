var express = require('express'),
    handlebars = require('express-handlebars'),
    bodyParser = require('body-parser'),
    path = require('path'),
    morgan = require('morgan');
    
var http = require('http');
var https = require('https');
var session = require('express-session');
var MySQLStore = require('express-mysql-session')(session);
var exphbs_sections = require('express-handlebars-sections');
var favicon = require('serve-favicon');
var mustache = require('mustache');
var moment = require('moment');
var wnumb = require('wnumb');
var dateformat = require('dateformat');

var app = express();

app.use(morgan('dev'));
app.engine('hbs', handlebars({
    extname: 'hbs',
    // defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    partialsDir: 'views/_partials/',
    helpers: {
        section: exphbs_sections(),
        now: function() {
            return moment().format('D/M/YYYY - HH:mm');
        },
        formatTime: function(date) {
            var d = new Date(date);
          //return dateformat(d,"shortDate");
            return dateformat(d, "dd/mm/yyyy");
        },
        formatNumber: function(n) {
            var nf = wnumb({
                thousand: ','
            });
            return nf.to(n);
        },
    }
}));
app.set('view engine', 'hbs');

app.use(express.static(
    path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));

var admin = require('./routes/adminRoute');
var category = require('./routes/categoryRoute');

var port = process.env.PORT || 8080;
var server = http.createServer(app);
server.listen(port, function() {
    console.log("Server is running on port 8080.");
});


//******************Trang người dùng*******************//

//******************Trang thành viên *******************//

//******************Trang admin san pham*******************//
app.use('/admin', admin);
app.use('/category', category);
// app.get('/category', function(req, res){
//     res.render('admin/category');
// });

