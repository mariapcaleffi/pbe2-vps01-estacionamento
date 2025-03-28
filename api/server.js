const express = require('express');
const cors = require('cors');
const routes = require('./src/routes');

const app = express();
app.use(cors());
app.use(express.json());
app.use(routes);

app.listen(3001, () => {
    console.log('Servidor em http://localhost:3001');
});