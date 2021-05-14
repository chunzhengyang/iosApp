const express = require('express')
const router = require('./src/backend/router')
const app = express()
const path = require('path');
const cors = require('cors');
const { PORT } = require('./src/config/serverConfig')

app.use(cors())
app.use('/', router);

app.get('/message/*', (req, res) => {
        res.sendFile(path.join(__dirname, 'build', 'index.html'));
});


app.use(express.static(path.join(__dirname, 'build')));

app.listen(PORT, () => console.log(`Listening on port ${PORT}`));