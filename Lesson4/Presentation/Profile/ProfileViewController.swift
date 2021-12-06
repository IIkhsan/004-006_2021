
import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!

    // MARK: - Variable
    var user: User = User(username: "", email: "", password: "", phoneNumber: "", city: "", avatar: #imageLiteral(resourceName: "post1"), status: "123123")
    
    // MARK: -  VC Life cycle
    override func viewDidLoad() {
        user = getUser()
        configureProfile(user: user)
        super.viewDidLoad()

    }
    
    // MARK: - Profile configuring method
    func configureProfile(user: User) {
        userImageView.image = user.avatar
        userLabel.text = user.username
        statusLabel.text = user.status
    }
    
    // MARK: - Method for getting actual user
    func getUser() -> User{
        if let vc = presentingViewController as? LoginViewController {
            return vc.user ?? user
        }
        return user
    }
    
    // MARK: - Button IBActions
    @IBAction func statusssssButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "statusSegue", sender: nil)
    
}
    @IBAction func logOutAction(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
        
    }
    
    
}

//MARK: - Change status delegate extension
extension ProfileViewController: ChangeStatusDelegate {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statusSegue" {
            let destinationVC = segue.destination as! ChangeStatusViewController
            destinationVC.delegate = self
        }
    }
    
    func changeData(status: String) {
        if status != "" {
            user.status = status
            configureProfile(user: user)
        }
    
    }
}


