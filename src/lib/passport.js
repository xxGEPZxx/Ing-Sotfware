const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.Login', new LocalStrategy({
    usernameField: 'Email_U',
    passwordField: 'password_U',
    passReqToCallback: true
}, async(req, Email_U, password_U, done) => {
    const rows = await pool.query('SELECT * FROM usuario WHERE Email_U = ?', [Email_U]);
    if(rows.length > 0){
        const user = rows[0];
        const valipassword = await helpers.machPassword(password_U, user.password_U);
        if(valipassword){
            done(null, user, user.Email_U);
        }else{
            done(null, false);
        }
    }else{
        return done(null, false);
    }
}));

passport.use('local.Registro', new LocalStrategy({
    usernameField: 'Email_U',
    passwordField: 'password_U',
    passReqToCallback: true }, async (req, Email_U, password_U, done) => {       
        const { Nombre_U, Apellido_U,F_N_U, CI_U, Sexo_U, Phone_U, Address_U } = req.body;

        const newUser = {         
            Email_U,
            password_U,
            Nombre_U, 
            Apellido_U,
            F_N_U, 
            CI_U, 
            Sexo_U, 
            Phone_U, 
            Address_U
        };
        newUser.password_U = await helpers.encryptPassword(password_U);
        const result = await pool.query('INSERT INTO usuario SET ?', [newUser]);
        newUser.idUsuario = result.insertId;
        return done(null, newUser);        
}));

passport.serializeUser((user, done) =>{
    done(null, user.idUsuario);
});

passport.deserializeUser(async (idUsuario, done) => {
  const rows = await pool.query('SELECT * FROM usuario WHERE idUsuario = ?', [idUsuario]);
  done(null, rows[0]);
});