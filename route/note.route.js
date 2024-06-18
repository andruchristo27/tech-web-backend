import express from 'express'
import { deleteNote, getNote, getNoteById, insertNote, updateNote } from '../controller/note.controller.js'

const router = express.Router()

router.post('/addNote', insertNote)
router.get('/notes', getNote)
router.get('/notes/:id', getNoteById)
router.put('/updateNote/:id', updateNote)
router.delete('/deleteNote/:id', deleteNote)

export default router