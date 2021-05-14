//
//  User.swift
//  PeacefulSprings
//
//  Created by AAA on 5/13/21.
//

import Foundation

struct User: Codable, Dictionarize {
    var userId: Int?
    var password: String
    var username: String
    var gender: String
    var region: String
    var imgPath: String
    
    init(username: String, password: String, gender: String,region: String, imgPath: String){
        self.username = username
        self.password = password
        self.gender = gender
        self.region = region
        self.imgPath = imgPath
    }
    
    func dictionary() -> [String: Any] {
        return [
            "username": username,
            "password": password,
            "gender": gender,
            "region": region,
            "imgPath": imgPath]
    }
    
    
}
