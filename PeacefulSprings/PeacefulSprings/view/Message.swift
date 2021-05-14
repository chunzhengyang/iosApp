//
//  Message.swift
//  PeacefulSprings
//
//  Created by AAA on 5/11/21.
//

import UIKit

enum Owner {
    case me
    case other
}

class Message{
    
    static var lastPostion: Int = 70
    
    var delegate: MessageDelegate?
    var text: String
    var profileImage: UIImage
    var owner: Owner
    var userId: Int
    
    static let myBubble = UIImage(named: "images/mebubble.png")!.stretchableImage(withLeftCapWidth: 15, topCapHeight:14)
    
    static let othersBubble = UIImage(named: "images/yoububble.png")!.stretchableImage(withLeftCapWidth: 20, topCapHeight:14)
    let FONT_SIZE = 9
    
    init(text: String, imagePath: String, userId: Int, owner: Owner, delegate: MessageDelegate?){
        self.delegate = delegate
        self.owner = owner
        self.userId = userId
        self.text = text
        if let img = UIImage(named: imagePath){
            self.profileImage = img
        } else {
            self.profileImage = UIImage(named: "blank.png")!
        }
    }
    
    func show() -> Void{
        buildMessage()
    }
    
    func buildMessage(){
        
        guard let appWidth = delegate?.getWidth() else {
            return
        }
        
        let PROFILE_WIDTH = 50
        let PROFILE_HEIGHT = 50
        let PROFILE_MARGIN = 10
        let BUBBLE_HOZ_MARGIN = 30
        let BUBBLE_VEX_MARGIN = 15

        let textLength = getTextLength()
        
        var bubbleX: Int, profileX: Int, bubble: UIImage
        
        if(self.owner == Owner.me){
            bubbleX = appWidth - PROFILE_WIDTH - PROFILE_MARGIN - (textLength * FONT_SIZE + BUBBLE_HOZ_MARGIN)
            bubble = Message.myBubble
            profileX = appWidth - PROFILE_WIDTH - PROFILE_MARGIN
        }else{
            bubbleX = PROFILE_WIDTH + PROFILE_MARGIN
            bubble = Message.othersBubble
            profileX = PROFILE_MARGIN
        }
        
        let label = buildLabel()
        
        let textHeight = Int(label.frame.height)
        
        let bubbleView = UIImageView(frame:CGRect(
                x: bubbleX,
                y: Message.lastPostion,
                width: textLength * FONT_SIZE + BUBBLE_HOZ_MARGIN,
                height: textHeight + BUBBLE_VEX_MARGIN //lines * FONT_SIZE + BUBBLE_VEX_MARGIN
            ))
                                     
        bubbleView.image = bubble
            
        Message.lastPostion += textHeight + BUBBLE_VEX_MARGIN + 20
        delegate?.setScrollViewHeight(Message.lastPostion)
        
        let profileView = UIButton(frame:CGRect(
                x: profileX,
                y: Message.lastPostion - BUBBLE_VEX_MARGIN - PROFILE_HEIGHT,
                width: PROFILE_WIDTH,
                height: PROFILE_HEIGHT
            ))


        //self.view.bounds.width - PROFILE_WIDTH - 10 - (8 * FONT_SIZE + 30)
        
        bubbleView.addSubview(label)
        self.delegate?.addView(bubbleView)
        profileView.setBackgroundImage(profileImage, for: .normal)
        profileView.tag = self.userId
        profileView.addTarget(self, action: #selector(self.navToInfo(_:)), for: .touchUpInside)
        profileView.isEnabled = true
        self.delegate?.addView(profileView)
    }

    @objc func navToInfo(_ sender: UIButton){}
    
    func buildLabel() -> UILabel{
    
        let font =  UIFont.boldSystemFont(ofSize: CGFloat(15))
        
        let label =  UILabel(frame: CGRect(x: 10, y: 5, width: 0, height: 0))
        
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = self.text
        label.font = font
        label.backgroundColor = UIColor.clear
        label.sizeToFit()
        return label
    }
    
    func getTextLength() -> Int{
        if self.text.count != 0 {
            return self.text.split(separator: "\n").sorted { (x, y) -> Bool in
                x.count > y.count
            }[0].count - 1
        }else{
            return 0
        }
    }
}
