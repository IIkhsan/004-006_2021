import UIKit

protocol StatusEditDelegate {
    func editStatus(text: String)
}

class UserProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    
    // MARK: - private properties
    var currentUser: User?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        currentUser = (tabBarController! as! TabBarController).getCurrentUser()
        
        profileImageView.image = currentUser?.image
        nameLabel.text = currentUser?.name
        statusLabel.text = currentUser?.status
    }

    // MARK: - IBAction
    @IBAction func editPressed(_ sender: Any) {
        guard let editProfileViewController = storyboard?.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController else { return }
        editProfileViewController.statusEditDelegate = self
        navigationController?.present(editProfileViewController, animated: true)
    }
}

//MARK: Extensions
extension UserProfileViewController: StatusEditDelegate{
    func editStatus(text: String) {
        statusLabel.text = text
    }
}
