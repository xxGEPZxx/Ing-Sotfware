const express = require('express');
//const expressSession = require('express-session');
const session = require('express-session');
const MySQLStore =  require('express-mysql-session');
const morgan = require('morgan');
const multer = require('multer');
const cors = require('cors');
const { engine } = require('express-handlebars');
const path = require('path');
const flash = require('connect-flash');
const passport = require('passport');

const { database } = require('./keys');


//Inicializaciones
const app = express();
app.use(cors());
require('./lib/passport');

//Donde cargar los archivos estaticos
app.use(express.static('public'));
app.use('/recursos', express.static(__dirname +'/public'));

const WhiteList = "*"; 

//Settings
app.set('port', process.env.PORT || 3001);
/* const port = process.env.PORT || 3001; */
app.set('views', path.join(__dirname, '/views'));
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutDir: path.join(app.get('views'), 'layouts'),
    partialDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));

app.set('view engine', '.hbs');

//Peticiones
app.use(session({
  secret: 'secret',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
})); 

app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(passport.initialize());
app.use(passport.session());



//app.use(expressSession.Session);

/* const storage = multer.diskStorage({
 destination: path.join(__dirname, 'public/uploads'),
 filename: (req, file, cb) =>{
    cb(null, new Date().getTime() + path.extname(file.originalname));
 }
}); */

//app.use(multer({storage}).single('Imagen_A'));

app.use(cors({
    origin: WhiteList
}));
/* const whitelist = ['https://drive.google.com', 'https://drive.google.com/file/d/1xjUhFpwwRc0Y6a1HsI1thPJRNR_KTJr8/view']
const corsOptions = {
  origin: (origin, callback) => {
    if (whitelist.indexOf(origin) !== -1) {
      callback(null, true)
    } else {
      callback(new Error())
    }
  }
} */

// Variables Globales
app.use((req, res, next) => {
  app.locals.success = req.flash('success');
  next();
});


app.use(function(req, res, next){
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
}); 

//Rutas
app.use(require('./routes/index'));
app.use('/Inicio', require('./routes/Inicio'));
//app.use(require('./routes/autenticacion'));
app.use(require('./routes/Login'));
//app.use('/Inicio', require('./routes/Inicio'));
app.use('/Guardar-Dispositivos', require('./routes/Guardar-Dispositivo'));
app.use('/Eliminar-Editar-Dispositivos', require('./routes/Eliminar-Editar-Dispositivo'));
app.use('/Ayuda', require('./routes/Ayuda'));
//app.use('/Login', require('./routes/Login'));

//Archivos Publico

app.use(express.static(path.join(__dirname, 'public')));

if (process.env.NODE_ENV !== 'production'){
    require('dotenv').config();
}


// Comenzar el servidor
app.listen(app.get('port'), () => {
    console.log('El servidor en el puerto', app.get('port'));
    console.log('EnviRonment: ', process.env.NODE_ENV);
});
/* 
app.listen(port, () => console.log('El servidor en el puerto ' + port)); */

/* 
const app = require('./config/server');

require('./app/routes') */

//Var sessiones




module.exports = app;