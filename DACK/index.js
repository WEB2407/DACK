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
                thousand: ' '
            });
            return nf.to(n) + ' VND';
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

app.use(session({
    secret: 'Z7X7gXzoKBT8h18jwXBEP4T0kJ8=',
    resave: false,
    saveUninitialized: true,
    // store: new fileStore()
    store: new MySQLStore({
        host: '127.0.0.1',
        port: 3306,
        user: 'root',
        password: '',
        database: 'QLBH',
        createDatabaseTable: true,
        schema: {
            tableName: 'sessions',
            columnNames: {
                session_id: 'session_id',
                expires: 'expires',
                data: 'data'
            }
        }
    }),
}));
var admin = require('./routes/adminRoute');
var category = require('./routes/categoryRoute');
var account = require('./routes/accountRoute');
var product = require('./routes/productRoute');
var layoutRoute = require('./routes/_layoutRoute');
var layoutpr = require('./routes/_layoutpr');
var home = require('./routes/homeRoute');
var order = require('./routes/orderRoute');

var producer = require('./routes/producerRoute');


var port = process.env.PORT || 8080;
var server = http.createServer(app);
server.listen(port, function() {
    console.log("Server is running on port 8080.");
});


//******************Trang người dùng*******************//

//******************Trang thành viên *******************//

//******************Trang admin san pham*******************//
app.use(layoutRoute);
app.use(layoutpr);

app.use('/admin', admin);
app.use('/category', category);
app.use('/account', account);
app.use('/shop', product);
app.use('/brand', producer);
app.use('/order', order);

app.use('/', home);

// app.get('/search', function(req, res){
//     res.render('/order');
// });

