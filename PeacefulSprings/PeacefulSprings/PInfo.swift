import UIKit

class PInfo: UIViewController {

    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var region: UILabel!
    
    var userId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Http.getUser(userId: self.userId){
            res in
            print("Getting info...")
            let user = res[0]
            print("Profile info is :", res)
            self.username.text = "Name: " + user.username
            self.id.text = "ID: 00000" + String(user.userId!)
            self.region.text = "Region: " + user.region
            self.profile.image = UIImage(named: user.imgPath)
            
        }

    }


}
