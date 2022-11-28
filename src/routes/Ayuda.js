const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/Ayuda', (rep, res) => {
    res.render('Ayuda/Ayuda');
});

/* router.post('/Guardar-Dispositivo', async (req, res) => {
    const {Nombre_P,  Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Camara_S_P, Camara_P_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas} = req.body; 

    const newGuardarDispositivo = {Nombre_P,  Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Camara_S_P, Camara_P_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas};

    await pool.query('INSERT INTO productos (Nombre_P, Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas) VALUES ?'), [Nombre_P,  Serial_P, Precio_P, Color_P, Modelo_P, Version_P, Ram_P, Rom_P, Pantalla_P, Camara_S_P, Camara_P_P, Bateria_P, Sensor_P, V_Android, Procesador_P, Imagen_P, Marcas_idMarcas];
    console.log('hola');
    res.send('recibido');
}); */


module.exports = router;