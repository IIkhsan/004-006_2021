import UIKit

// MARK: - ProfileStatusViewControllerDelegate protocol

protocol ProfileStatusViewControllerDelegate: AnyObject {
    
    // Change user data func
    
    func changeUserData(currentUser: User?)
}

class ProfileStatusViewController: UIViewController {
    
    // IBOutlets

    @IBOutlet weak var profileStatusView: UIView!
    @IBOutlet weak var profileStatusImageView: UIImageView!
    @IBOutlet weak var profileStatusHeadingLabel: UILabel!
    @IBOutlet weak var profileStatusTextField: UITextField!
    @IBOutlet weak var profileStatusSaveChangesButton: UIButton!
    
    // MARK: - Initialization
    
    weak var delegate: ProfileStatusViewControllerDelegate?
    var currentUser: User?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileDetailData()
    }
    
    // MARK: - Private funcs
    
    private func setProfileDetailData() {
        profileStatusHeadingLabel.text = "Write new status"
        profileStatusImageView.image = currentUser?.profileImageView
        profileStatusImageView.layer.cornerRadius = profileStatusImageView.frame.size.height / 2
    }
    
    // IBActions
    
    @IBAction func profileStatusSaveChangesAction(_ sender: Any) {
        guard var currentUser = currentUser else { return }
        currentUser.profileStatus = profileStatusTextField.text ?? ""
        delegate?.changeUserData(currentUser: currentUser)
        dismiss(animated: true)
    }
}
