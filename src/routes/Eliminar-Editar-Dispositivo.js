const express = require('express');
const router = express.Router();

const pool = require('../database');

/* router.get('/Eliminar-Dispositivo', (rep, res) => {
    res.render('Eliminar-Dispositivo/Eliminar-Dispositivo');
}); */

router.get('/', async (red, res) => {
    const productosalmacen = await pool.query('SELECT * FROM productosalmacen');
    res.render('Eliminar-Editar-Dispositivos/Eliminar-Editar-Dispositivo', {productosalmacen});
    //console.log(productosalmacen);
 });

 router.get('/Modificar/:idProductosalmacen_A', async (req, res) => {
    const { idProductosalmacen_A } = req.params;
    const productosalmacen = await pool.query('SELECT * FROM productosalmacen WHERE idProductosalmacen_A = ?', [idProductosalmacen_A]);
    //res.redirect('/Eliminar-Editar-Dispositivos/Modificar', {productosalmacen: productosalmacen});
    console.log(productosalmacen);
    res.render('Eliminar-Editar-Dispositivos/Modificar', {productosalmacen: productosalmacen[0] });
 });

 router.get('/delete/:idProductosalmacen_A', async (req, res) => {
    const { idProductosalmacen_A } = req.params;
    await pool.query('DELETE FROM productosalmacen WHERE idProductosalmacen_A = ?', [idProductosalmacen_A]);
    res.redirect('/Eliminar-Editar-Dispositivos');
 });


module.exports = router;