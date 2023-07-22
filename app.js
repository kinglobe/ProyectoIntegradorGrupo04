const express = require('express');
const path = require('path');

const app = express();
const PORT = 3031;

app.use(express.static('public'));

/* rutas */
app.get('/',(req,res) => res.sendFile(path.join(__dirname,'views','home.html')));

app.get('/login',(req,res) => res.sendFile(path.join(__dirname,'views','login.html')));

app.get('/registro',(req,res) => res.sendFile(path.join(__dirname,'views','registro.html')));

app.get('/detalle-producto',(req,res) => res.sendFile(path.join(__dirname,'views','detalle-producto.html')));

app.get('/header',(req,res) => res.sendFile(path.join(__dirname,'views','partials','header.html')));

app.get('/footer',(req,res) => res.sendFile(path.join(__dirname,'views','partials','footer.html')));



app.listen(PORT, () => console.log(`server running in http://localhost:${PORT}`));