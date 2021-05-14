//
//  MessageDelegate.swift
//  PeacefulSprings
//
//  Created by AAA on 5/11/21.
//
import UIKit

protocol ProfileImgDelegate {
    var img: UIButton! { get set }
    
    func setImg(imgPath: String)
}
