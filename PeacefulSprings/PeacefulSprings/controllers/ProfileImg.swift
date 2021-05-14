import UIKit

class ProfileImg: UIViewController {

    var delegate: ProfileImgDelegate?
    
    @IBOutlet weak var i1: UIButton!
    @IBOutlet weak var i2: UIButton!
    @IBOutlet weak var i3: UIButton!
    @IBOutlet weak var i4: UIButton!
    @IBOutlet weak var i5: UIButton!
    @IBOutlet weak var i6: UIButton!
    @IBOutlet weak var i7: UIButton!
    @IBOutlet weak var i8: UIButton!
    @IBOutlet weak var i9: UIButton!
    @IBOutlet weak var i10: UIButton!
    @IBOutlet weak var i11: UIButton!
    @IBOutlet weak var i12: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        i1.setBackgroundImage(UIImage(named: "images/1.png"), for: .normal)
        i2.setBackgroundImage(UIImage(named: "images/2.png"), for: .normal)
        i3.setBackgroundImage(UIImage(named: "images/3.png"), for: .normal)
        i4.setBackgroundImage(UIImage(named: "images/4.png"), for: .normal)
        i5.setBackgroundImage(UIImage(named: "images/5.png"), for: .normal)
        i6.setBackgroundImage(UIImage(named: "images/6.png"), for: .normal)
        i7.setBackgroundImage(UIImage(named: "images/7.png"), for: .normal)
        i8.setBackgroundImage(UIImage(named: "images/8.png"), for: .normal)
        i9.setBackgroundImage(UIImage(named: "images/9.png"), for: .normal)
        i10.setBackgroundImage(UIImage(named: "images/10.png"), for: .normal)
        i11.setBackgroundImage(UIImage(named: "images/11.png"), for: .normal)
        i12.setBackgroundImage(UIImage(named: "images/12.png"), for: .normal)
    }

    @IBAction func set1(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/1.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set2(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/2.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set3(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/3.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set4(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/4.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set5(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/5.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set6(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/6.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set7(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/7.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set8(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/8.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set9(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/9.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set10(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/10.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set11(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/11.png")
        navigationController?.popViewController(animated: true)
    }
    @IBAction func set12(_ sender: Any) {
        self.delegate?.setImg(imgPath: "images/12.png")
        navigationController?.popViewController(animated: true)
    }
}
