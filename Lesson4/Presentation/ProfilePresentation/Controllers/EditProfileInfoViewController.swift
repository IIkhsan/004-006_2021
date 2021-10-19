//
//  EditProfileInfoViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 15.10.2021.
//

import UIKit

class EditProfileInfoViewController: UIViewController {
    
    @IBOutlet weak var newStatusTextField: UITextField!
    weak var delegate: EditProfileViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func acceptChangesAction(_ sender: Any) {
        
        UserDatasource.currentUser?.status = newStatusTextField.text ?? ""
        
        delegate?.updateStatus()
        
        dismiss(animated: true)
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
protocol EditProfileViewControllerDelegate: AnyObject {
    func updateStatus()
}
