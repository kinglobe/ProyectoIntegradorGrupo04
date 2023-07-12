const express = require('express');
const path = require('path');

const app = express();
const PORT = 3031;

app.use(express.static('public'));

/* rutas */
app.get('/',(req,res) => res.sendFile(path.join(__dirname,'views','home.html')));



app.listen(PORT, () => console.log(`server running in http://localhost:${PORT}`));