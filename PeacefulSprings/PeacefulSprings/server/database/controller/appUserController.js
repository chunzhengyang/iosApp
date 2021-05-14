const {queryDB} = require('../DBpool/mysqlPool')

function appUserController(req, res){
    console.log(req.method)
    switch(req.method){
        
        case 'GET': 
            get(req, res)
        break
        case 'PATCH': 
            getById(req, res)
        break
        case 'POST': 
            let data = req.body
            console.log(req.body)
            if(data)
                add(data)
            break
        case 'PUT': 
            let data1 = req.body
            console.log(req.body)
            if(data1)
                check(data1, res)
            break
        default:
            console.log('Unknown request method!')
    }
}

function add({username, password, gender, region, imgPath}){

    var sql = `INSERT INTO User (username, password, gender, region, imgPath) 
    values ('${username}', '${password}', '${gender}', '${region}', '${imgPath}')`

    console.log(sql)

    queryDB(sql, function (err, results) {
        if(err) 
            console.log(err)
    })
}

function get(req, res){
    let username = req.params.username

    const sql = `select * from User where username = "${username}"`

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

function getById(req, res){
    let userId = req.params.userid
console.log(req.params)
    const sql = `select * from User where userId = "${userId}"`

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

function check({username, password}, res){

    const sql = `select * from User where username = "${username}" && password = "${password}"`

    console.log(sql)

    queryDB(sql, function (err, results) {  
        if(err) 
            console.log(err)
        else{              
            res.send(results[0]!=null)
        }
    })
}



module.exports = {
    appUserController
}