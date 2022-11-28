const express = require('express');
const router = express.Router();

const pool = require('../database');

/* router.get('/Inicio', (rep, res) => {
    res.render('Inicio/Inicio');
}); */

router.get('/', async (red, res) => {
    const productosalmacen = await pool.query('SELECT * FROM productosalmacen');
    res.render('Inicios/Inicio', {productosalmacen});
    //console.log(productosalmacen);
 });

/*  router.get('/Eliminar-Dispositivo', async (red, res) => {
    const productosalmacen = await pool.query('SELECT * FROM productosalmacen');
    res.render('Eliminar-Dispositivo/Eliminar-Dispositivo', {productosalmacen});
    console.log(productosalmacen);
 }); */

/* function Inicio(req, res){
    res.render('views/Login')
}

module.exports = {
    views: Inicio
} */
module.exports = router;