/* const express = require('express');
const passport = require('passport');
const router = express.Router();
const pool = require('../database');

router.get('/', (rep, res) => {
    res.render('Login/Login');
});

router.post('/Login', passport.authenticate('local.Login', {
        successRedirect: '/Perfil',
        failureRedirect: '/Login'
}));

router.get('/Perfil', (req, res) => {
    res.send('SIIIIIIIIIIIIIIIIIII');
});

module.exports = router; */