//
//  ChatViewController.swift
//  PeacefulSprings
//
//  Created by AAA on 5/10/21.
//

import UIKit

class ChatViewController: UIViewController, MessageDelegate, UITextFieldDelegate{
    @IBAction func logout(_ sender: Any) {
        print("Logging out...")
        Message.lastPostion = 70
        timer?.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
    var myname = "No Name"
    var myUserId = -1
    var myImgPath = "images/blank.png"
    
    var othersname = "Searching..."
    var newestTextIndex = -1
    
    var timer: Timer?

    @IBOutlet weak var navBar: UINavigationItem!
    
    @IBOutlet weak var nav: UINavigationBar!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var placeholderView: UIView!
    
    @IBOutlet weak var textInput: UITextField!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func sendText(_ sender: Any) {
        guard let ti = textInput.text else {
            return
        }
        textInput.text = ""
        if ti == ""{
            return
        }
        //send to server
        Http.addText(text: Text(username: myname, userId: myUserId, text: ti, imgPath: myImgPath))

    }
    
    func getMessageFromServer(){
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) {
            _ in
            Http.getText{
                texts in
                let len = texts.count
                if texts.count > self.newestTextIndex{
                    for i in 0..<len where i > self.newestTextIndex{
                        let t = texts[i]
                        self.newestTextIndex = i
                        var owner = Owner.other
                        let n = t.username
                        if(n == self.myname){
                            owner = Owner.me
                        }else{
                            self.othersname = n
                        }
                        Message(text: t.text,
                                imagePath: t.imgPath,
                                userId: t.userId,
                                owner: owner,
                                delegate: self)
                        .show()
                    }
                }
            }
        }
    }
    
    func getMyInfo(next: @escaping()->Void){
        Http.getUser(username: self.myname){
            res in
            print("Getting my information...")
            print("I am \(res)")
            let user = res[0]
            print(user)
            self.myUserId = user.userId!
            self.myImgPath = user.imgPath
            next()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavBarTitle()
        getMyInfo{
            self.getMessageFromServer()
        }
        self.textInput.delegate = self
        self.view.clipsToBounds = true
        self.scrollView.isScrollEnabled = true
        self.scrollView.delaysContentTouches = false
        self.scrollView.addSubview(nav)
    }
    
    func updateNavBarTitle(){
        navBar.title = othersname
    }
    
    func addView(_ view: UIView) {
        self.scrollView.addSubview(view)
    }
    
    @objc func navToInfo(_ sender: UIButton){
        let m = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let i = m.instantiateViewController(identifier: "PInfo") as?
                PInfo else{
            return
        }
        i.userId = sender.tag
        present(i, animated: true, completion: nil)
//        print(self.navigationController ?? "No navigation controller found!")
//        self.navigationController?.pushViewController(i, animated: true)
    }    

    func getWidth() -> Int {
        return Int(self.view.bounds.width)
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        sendText(textField)
//        return false
//    }
    
    func setScrollViewHeight(_ h:Int){
        self.scrollView.contentSize.height = CGFloat(h)
        if(self.scrollView.contentSize.height > self.placeholderView.bounds.height){
            self.scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height + scrollView.contentInset.bottom), animated: true)
        }
    }
}
