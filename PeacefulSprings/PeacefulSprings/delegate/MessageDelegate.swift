//
//  MessageDelegate.swift
//  PeacefulSprings
//
//  Created by AAA on 5/11/21.
//
import UIKit

protocol MessageDelegate {
    
    func navToInfo(_ sender: UIButton)
    
    func addView(_ view: UIView)
    
    func getWidth() -> Int
    
    func setScrollViewHeight(_ h: Int)

}
