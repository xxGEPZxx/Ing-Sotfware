const express = require('express');
const router = express.Router();

const pool = require('../database');
const cloudinary = require('cloudinary');

cloudinary.config({
    cloud_name: 'xxgepzxx',
    api_key: '239487815862581',
    api_secret: '8bJqeNlz773sj4Zi2EuHTXglGXY'
});
/* 
router.get('/', (req, res) => {
    res.send('Hello World' + '<h1>Holaaa</h1>');
}); */

router.get('/', async (red, res) => {
    const productosalmacen = await pool.query('SELECT * FROM productosalmacen');
    res.render('Inicios/Inicio', {productosalmacen});
    console.log(productosalmacen);
 });

module.exports = router;