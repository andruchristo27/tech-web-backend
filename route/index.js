import express from 'express'
import noteRoute from './note.route.js'

const router = express()

router.use(noteRoute)

export default router