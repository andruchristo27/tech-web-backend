import express from 'express'
import userRoute from '../route/user.route.js'
import authRoute from './auth.route.js'
import { authenticateToken } from '../middleware/validate.middleware.js'

const router = express()

router.use(authRoute)
router.use(authenticateToken, userRoute)
// router.use(siswaRoute)
// router.use(passport.authenticate('jwt', { session: false }), siswaRoute)


export default router