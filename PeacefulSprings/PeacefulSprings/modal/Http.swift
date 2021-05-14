//
//  sendRequest.swift
//  PeacefulSprings
//
//  Created by AAA on 5/10/21.
//

import Foundation
import Alamofire

class Http{
    
    static let domain = "http://www.lmmusa.com/"

    static func sendRequest(send data: [String: String],to url: String, then callback: @escaping(String)->Void){
        //let urls:String = "http://www.lmmusa.com/contact"
        
        //let parameters:Dictionary = data ["name":"hahaha"]
        
        AF.request(URL(string: url)!, method: .post, parameters: data, encoding: JSONEncoding.default)
                        .responseString { (responses) in
            let res:String = responses.value ?? "No response!"
            callback(res)
            
        }
    }
    
    static func addUser(user: User){
        let url:String = domain + "app/user"
        add(url: url, something: user)
    }
    
    static func addText(text: Text){
        let url:String = domain + "app/text"
        add(url: url, something: text)
    }
    
    static func add(url: String, something: Dictionarize){
        AF.request(URL(string: url)!, method: .post, parameters: something.dictionary(), encoding: JSONEncoding.default).responseString { (responses) in
            let res:String = responses.value ?? "No response!"
            print(res)
        }
    }
    
    static func getUser(userId: Int, callback: @escaping([User])->Void){
        getUser(info: String(userId), method: .patch, callback: callback)
    }
    
    static func getUser(username: String, callback: @escaping([User])->Void){
        getUser(info: username,method: .get, callback: callback)
    }
    
    static func getUser(info: String, method: HTTPMethod, callback: @escaping([User])->Void){
        print("here")
        let url:String = domain + "app/user/\(info)"
        print(url)
        print(method)
        AF.request(URL(string: url)!, method: method, parameters: nil, encoding: JSONEncoding.default).responseString { (responses) in
            let res:String = responses.value ?? "----------------No response!----------------"
            print(res)
            let start = res.index(res.startIndex, offsetBy: 11)
            let end = res.index(res.endIndex, offsetBy: -1)
            let range = start..<end

            let r = res[range]

            print(r)
            let data = Data(r.utf8)
            print(data)
            let decoder = JSONDecoder()

            do {
                let body = try decoder.decode([User].self, from: data)
                callback(body)
            } catch {
                print(error.localizedDescription)
            }
            
        }

    }
    
    static func getText(callback: @escaping([Text])->Void){
        
        let url:String = domain + "app/text"

        AF.request(URL(string: url)!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseString { (responses) in
            let res:String = responses.value ?? "No response!"
            //print(res)
            let start = res.index(res.startIndex, offsetBy: 11)
            let end = res.index(res.endIndex, offsetBy: -1)
            let range = start..<end

            let r = res[range]

            print("Getting text..." + r)
            let data = Data(r.utf8)
            let decoder = JSONDecoder()

            do {
                let body = try decoder.decode([Text].self, from: data)
                callback(body)
            } catch {
                print(error.localizedDescription)
            }
            
        }

    }
    
    
    static func checkUser(username: String, password: String, callback: @escaping(String)->Void){
        let url:String = domain + "app/user"
        print(url)
        AF.request(URL(string: url)!, method: .put, parameters: ["username": username, "password": password], encoding: JSONEncoding.default).responseString {
            (responses) in
            let res:String = responses.value ?? "----------------No response!----------------"
            print(res)
            callback(res)
        }
    }
}
    

//    static func testRequest(_ callback: @escaping([Text])->Void){
//        let data = Data(test.utf8)
//
//        let decoder = JSONDecoder()
//
//        do {
//            let text = try decoder.decode([Text].self, from: data)
//            print(text)
//            callback(text)
//        } catch {
//            print(error.localizedDescription)
//        }
//    }



//static func testRequest(_ callback: @escaping(String)->Void){
//    let url:String = "http://www.lmmusa.com/contact"
//
//    let data:Dictionary = ["name":"hahaha"]
//
//    AF.request(URL(string: url)!, method: .post, parameters: data, encoding: JSONEncoding.default)
//                    .responseString { (responses) in
//        let res:String = responses.value ?? "No response!"
//        callback(res)
//
//    }
//}
