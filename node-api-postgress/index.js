const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const db = require('./queries')
const port = 3000

app.use(bodyParser.json())
app.use(
    bodyParser.urlencoded({
        extended: true,
    })
)

app.get('/', (request, response) => {
    response.json({
        info: 'Node.js, Express, and Postgres API'
    })
})

app.get('/acara', db.getAcara)
app.get('/acara/:id', db.getAcaraById)
app.post('/acara', db.createAcara)
app.put('/acara/:id', db.updateAcara)
app.delete('/acara/:id', db.deleteAcara)


app.get('/bulan', db.getBulan)

app.listen(port, () => {
    console.log(`App running on port ${port}.`)
})
