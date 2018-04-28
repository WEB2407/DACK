var express = require('express'),
    handlebars = require('express-handlebars'),
    bodyParser = require('body-parser'),
    path = require('path'),
    morgan = require('morgan');
    
var http = require('http');
var https = require('https');

var app = express();

app.use(morgan('dev'));
app.engine('hbs', handlebars({
    extname: 'hbs',
    // defaultLayout: 'main',
    layoutsDir: 'views/_layouts/',
    partialsDir: 'views/_partials/',
    helpers: {}
}));
app.set('view engine', 'hbs');

app.use(express.static(
    path.resolve(__dirname, 'public')
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));


var port = process.env.PORT || 3000;
var server = http.createServer(app);
server.listen(port, function() {
    console.log("Server is running on port 3000.");
});


//******************Trang người dùng*******************//
app.get('/', function(req, res){
	res.render('user/index');
});
app.get('/shop', function(req, res){
    res.render('user/shop');
});
app.get('/product-detail', function(req, res){
    res.render('user/product-detail');
});
app.get('/search', function(req, res){
    res.render('user/search');
});
app.get('/sign-up', function(req, res){
    res.render('user/sign-up');
});
//******************Trang thành viên *******************//
app.get('/cart', function(req, res){
    res.render('member/cart');
});
app.get('/checkout', function(req, res){
    res.render('member/checkout');
});
app.get('/history-orders', function(req, res){
    res.render('member/history-orders');
});
app.get('/list-orders', function(req, res){
    res.render('member/list-orders');
});
app.get('/member', function(req, res){
    res.render('member/member');
});
app.get('/order-complete', function(req, res){
    res.render('member/order-complete');
});
app.get('/profile', function(req, res){
    res.render('member/profile');
});
//******************Trang admin san pham*******************//

app.get('/admin', function(req, res){
    res.render('admin/admin');
});
app.get('/product', function(req, res){
    res.render('admin/product');
});
app.get('/order', function(req, res){
    res.render('admin/order');
});
app.get('/category', function(req, res){
    res.render('admin/category');
});
app.get('/brand', function(req, res){
    res.render('admin/brand');
});
app.get('/login', function(req, res){
    res.render('admin/page-login');
})
