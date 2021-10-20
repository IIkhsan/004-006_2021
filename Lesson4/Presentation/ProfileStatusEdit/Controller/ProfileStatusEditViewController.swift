//
//  ProfileStatusEditViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 15.10.2021.
//

import UIKit

class ProfileStatusEditViewController: UIViewController {

    //MARK: - Properties
    weak var delegate: ProfileStatusEditDelegateProtocol?
    var oldStatus: String?
    
    //MARK: - IBOutlets
    @IBOutlet var profileStatusEditView: ProfileStatusEditView!
    
    //MARK: - IBActions
    @IBAction func okButtonPressed(_ sender: UIButton) {
        delegate?.changeStatus(status: profileStatusEditView.statusTextField.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileStatusEditView.statusTextField.text = oldStatus ?? ""
    }
}
