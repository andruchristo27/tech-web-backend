import express from 'express'
import { getUser } from '../controller/user.controller.js'
import { authenticateToken } from '../middleware/validate.middleware.js'

const router = express.Router()

router.get('/users', getUser)

export default router