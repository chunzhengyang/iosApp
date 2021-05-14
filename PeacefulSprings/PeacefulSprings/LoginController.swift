import UIKit

class LoginController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet weak var warnning: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warnning.isHidden = true
    }
    

    @IBAction func login(_ sender: Any) {
        let u = username.text
        let p = password.text
        Http.checkUser(username: u!, password: p!){
            res in
            if(res == "true"){
                self.showApp()
                self.reset()
            }else{
                self.warnning.isHidden = false
            }
        }
    }
    
    func showApp(){
        let m = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let d = m.instantiateViewController(identifier: "ChatViewController") as?
                ChatViewController else{
            return
        }
        d.myname = username.text!
        d.modalPresentationStyle = .fullScreen
        present(d, animated: true, completion: nil)
    }
    
    func reset(){
        warnning.isHidden = true
        username.text = ""
        password.text = ""
    }
}
