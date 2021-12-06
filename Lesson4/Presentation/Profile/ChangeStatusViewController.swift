import UIKit
import Foundation

protocol ChangeStatusDelegate: AnyObject {
    func changeData(status: String)
}

class ChangeStatusViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var newStatusTextField: UITextField!
    
    //MARK: - Delegate
     var delegate: ChangeStatusDelegate?
    
    // MARK: -  VC Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    // MARK: - Button IBAction
    @IBAction func newStatusConfrimAction(_ sender: Any) {
        let status = newStatusTextField.text ?? ""
        delegate?.changeData(status: status)
        dismiss(animated: true)
    }
}
