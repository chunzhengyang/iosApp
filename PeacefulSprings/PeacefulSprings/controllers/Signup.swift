import UIKit

class Signup: UIViewController, ProfileImgDelegate{

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var region: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    var imgPath = "images/blank.png"
    
    @IBOutlet weak var img: UIButton!
    
    @IBAction func selectImg(_ sender: Any) {
        let m = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let i = m.instantiateViewController(identifier: "ProfileImg") as?
                ProfileImg else{
            return
        }
        i.delegate = self
        i.modalPresentationStyle = .fullScreen
        print(navigationController ?? "No navigation controller found! (Signup)")
        navigationController?.pushViewController(i, animated: true)

    }
    
    @IBAction func submit(_ sender: Any) {
        let u = username.text
        let p = password.text
        let r = region.text
        let g = gender.titleForSegment(at: gender.selectedSegmentIndex)
        let i = imgPath
        if u == "" || p == "" || r == "" {
            return
        }else{
            print("Creating...")
            Http.addUser(user: User(username: u!, password: p!, gender: g!, region: r!, imgPath: i))
        }
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImg(imgPath: imgPath)
    }

    func setImg(imgPath: String) {
        self.imgPath = imgPath
        img.setBackgroundImage(UIImage(named: imgPath), for: .normal)
    }

}


