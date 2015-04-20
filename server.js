
var express = require ('express') ;
var app = express() ; 
var mysql      = require('mysql');
var exphbs  = require('express-handlebars');
var bodyParser= require('body-parser');
var ip = process.env.OPENSHIFT_NODEJS_IP || "127.0.0.1" ; 
var port =  process.env.OPENSHIFT_NODEJS_PORT || 3000; 
app.use(bodyParser.json()); 
app.use(bodyParser.urlencoded({ extended: true })); 

var sql = mysql.createConnection({
  host     : 'localhost',
  user     : '********,
  password : '********',
  database : '********',
  insecureAuth: true
});
var routes = require('./routes/ruta.js') (app,sql) ; //Rutas para accesar dentro del serivdor 

app.engine('handlebars', exphbs({defaultLayout: 'main'})); //Definimos el modo de plantillas para la aplicacion
app.set('view engine', 'handlebars'); // Se usara el motor de plantillas handlebars 

app.use(express.static('./public'));//Definimos un directorio publico para almacenar todo lo estatico   

app.listen (port,ip);
