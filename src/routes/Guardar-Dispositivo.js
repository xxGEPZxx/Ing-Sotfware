const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/', (rep, res) => {
    res.render('Guardar-Dispositivos/Guardar-Dispositivo');
});

router.post('/Guardar-Dispositivo', async (req, res) => {
    const {Nombre_A,  Serial_A, Precio_A, Color_A, Modelo_A, Version_A, Ram_A, Rom_A, Pantalla_A, Camara_S_A, Camara_P_A, Bateria_A, Sensor_A, V_Android_A, Procesador_A, Imagen_A, Marcas_idMarcas} = req.body; 

    const newGuardarDispositivo = {Nombre_A,  Serial_A, Precio_A, Color_A, Modelo_A, Version_A, Ram_A, Rom_A, Pantalla_A, Camara_S_A, Camara_P_A, Bateria_A, Sensor_A, V_Android_A, Procesador_A, Imagen_A, Marcas_idMarcas};

    await pool.query('INSERT INTO productosalmacen set ?', [newGuardarDispositivo]);
    req.flash('success', 'Se guardo bien')
    res.redirect('/Eliminar-Editar-Dispositivos');
    //res.send('SIIUU');
});


/* 
router.post('/Guardar-Dispositivo', async (req, res) => {
    const {Nombre_P,  Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Camara_S_P, Camara_P_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas} = req.body; 

    const newGuardarDispositivo = {Nombre_P,  Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Camara_S_P, Camara_P_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas};

    await pool.query('INSERT INTO productos (Nombre_P, Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas) VALUES ?'), [Nombre_P,  Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Camara_S_P, Camara_P_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas];
    console.log('hola');
    res.send('recibido');
}); 
*/


module.exports = router;