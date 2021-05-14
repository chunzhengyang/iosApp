//
//  User.swift
//  PeacefulSprings
//
//  Created by AAA on 5/13/21.
//

import Foundation

struct Text: Codable, Dictionarize {
    var userId: Int
    var username: String
    var imgPath: String
    var text: String

    init(username: String, userId: Int, text: String, imgPath: String){
        self.username = username
        self.userId = userId
        self.text = text
        self.imgPath = imgPath
    }
    
    func dictionary() -> [String: Any] {
        return [
            "userId": userId,
            "username": username,
            "text": text,
            "imgPath": imgPath]
    }
}
