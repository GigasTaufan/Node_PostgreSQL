const Pool = require('pg').Pool
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'learning_activity',
    password: 'gigas',
    port: 5432,
})

// Get Acara
const getAcara = (request, response) => {
    pool.query('SELECT * FROM acara', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

// get bulan
const getBulan = (request, response) => {
    pool.query('SELECT * FROM bulan', (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

// Get Acara By ID
const getAcaraById = (request, response) => {
    const id = parseInt(request.params.id)

    pool.query('SELECT * FROM acara WHERE id_acara = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).json(results.rows)
    })
}

// Create Acara
const createAcara = (request, response) => {
    const {
        id_metode,
        nama_acara,
        id_bulan,
        tanggal_mulai,
        tanggal_selesai
    } = request.body

    pool.query('INSERT INTO acara (id_metode, nama_acara, id_bulan, tanggal_mulai, tanggal_selesai) VALUES ($1, $2, $3, $4, $5)', [id_metode, nama_acara, id_bulan, tanggal_mulai, tanggal_selesai], (error, results) => {
        if (error) {
            throw error
        }
        response.status(201).send(`Acara added with ID: ${results.insertId}`)
    })
}

// Update Acara
const updateAcara = (request, response) => {
    const id = parseInt(request.params.id)
    const {
        id_metode,
        nama_acara,
        id_bulan,
        tanggal_mulai,
        tanggal_selesai
    } = request.body

    pool.query(
        'UPDATE acara SET id_metode = $1, nama_acara = $2, id_bulan=$3, tanggal_mulai=$4, tanggal_selesai=$5 WHERE id_acara = $6',
        [id_metode, nama_acara, id_bulan, tanggal_mulai, tanggal_selesai, id],
        (error, results) => {
            if (error) {
                throw error
            }
            response.status(200).send(`Acara modified with ID: ${id}`)
        }
    )
}

// Delete Acara
const deleteAcara = (request, response) => {
    const id = parseInt(request.params.id)

    pool.query('DELETE FROM acara WHERE id_acara = $1', [id], (error, results) => {
        if (error) {
            throw error
        }
        response.status(200).send(`Acara deleted with ID: ${id}`)
    })
}

module.exports = {
    getAcara,
    getAcaraById,
    createAcara,
    updateAcara,
    deleteAcara,

    getBulan
}