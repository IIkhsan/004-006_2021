import UIKit

class EditProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - properties
    var statusEditDelegate: StatusEditDelegate?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func savePressed(_ sender: Any) {
        statusEditDelegate?.editStatus(text: statusTextView.text)
    }
}
