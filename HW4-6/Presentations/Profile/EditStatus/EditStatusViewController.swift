//
//  EditStatusViewController.swift
//  HW4-6
//
//  Created by Arslan Rashidov on 21.11.2021.
//

import UIKit

protocol EditStatusDelegate: AnyObject {
    func userDidEnterInformation(ID: String, status: String)
}

class EditStatusViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet var statusTextField: UITextField!
    
    @IBAction func doneButtonAction(_ sender: Any) {
        if statusTextField.text! != getLastStatus() {
            delegate?.userDidEnterInformation(ID: Array(userData!.keys)[0], status: statusTextField.text!)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Properties
    var userData: Dictionary<String, [String]>?
    weak var delegate: EditStatusDelegate?
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var status = getLastStatus()
        statusTextField.text = status
    }
    // MARK: - Private Methods
        
    private func getLastStatus() -> String {
        return Array(userData!.values)[0][1]
    }
}
