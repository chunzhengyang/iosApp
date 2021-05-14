const LIMIT = 50
const HOST = 'localhost'
const PORT = 3306
const USER = 'root'
const PASSWORD = process.env.NODE_ENV === 'test' ? '1' : ''
//const PASSWORD = '1'
const DATABASE = 'psrings'

module.exports = {
    LIMIT,
	HOST,
  	PORT,
  	USER,
  	PASSWORD,
  	DATABASE
}
