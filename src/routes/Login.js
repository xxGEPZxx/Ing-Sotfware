const express = require('express');
const router = express.Router();
const passport = require('passport');
//const app = require('..');
const pool = require('../database');

/* const session = require('express-session');
app.use(session({
  secret: 'secret',
  resave: true,
  saveUninitialized: true
})), */

router.get('/Login', (rep, res) => {
    res.render('Login/Login');
});

router.post('/Login', (req, res, next) => {         
        passport.authenticate('local.Login', { 
        successRedirect: '/Perfil',
        failureRedirect: '/Login'
        })(req, res, next);
});


router.get('/Registro', (req, res) => {
    res.render('Login/Registro');
});

router.post('/Registro', passport.authenticate('local.Registro', {
        successRedirect: '/Perfil',
        failureRedirect: '/Registro'
    }));

router.get('/Perfil', (req, res) => {
    res.send('Seee')
})

/* router.get('/Perfil', (req, res) => {
    res.send('SIIIIIIIIIIIIIIIIIII');
}); */

module.exports = router;