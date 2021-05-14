const express = require('express')
const router = express.Router()

const bodyParser = require('body-parser')

const { appUserController } = require('../database/controller/appUserController')
const { appTextController } = require('../database/controller/appTextController')
const jsonParser = bodyParser.json()


router.get('/app/user/:username',jsonParser, appUserController)
router.patch('/app/user/:userid',jsonParser, appUserController)

router.post('/app/user',jsonParser, appUserController)
router.put('/app/user',jsonParser, appUserController)


router.get('/app/text',jsonParser, appTextController)
router.post('/app/text',jsonParser, appTextController)

module.exports = router
