const {queryDB} = require('../DBpool/mysqlPool')

function appTextController(req, res){
    console.log("come in...")
    switch(req.method){
        case 'GET': 
            get(res)
        break

        case 'POST': 
            let data = req.body
            console.log(req.body)
            if(data)
                add(data)
            break
        default:
            console.log('Unknown request method!')
    }
}

function add({userId, username, imgPath, text}){

    var sql = `INSERT INTO Text (userId, username, imgPath, text) 
    values ('${userId}', '${username}', '${imgPath}', '${text}')`

    console.log(sql)

    queryDB(sql, function (err, results) {
        if(err) 
            console.log(err)
    })
}

function get(res){

    const sql = `select userId, username, imgPath, text from Text`

    console.log(sql)

    queryDB(sql, function (err, results) {  
        if(err) 
            console.log(err)
        else{              
            res.send(JSON.stringify({
                results
            }))
        }
    })
}

module.exports = {
    appTextController
}