//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Илья on 19.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    //IBOutlet
    @IBOutlet weak var yourProfileLabel: UILabel!
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var statusTextField: UITextField!
    
    @IBAction func statusChangeButton(_ sender: Any) {
        statusTextField.placeholder = statusTextField.text
        statusTextField.text = ""
    }
    
    @IBAction func changePasswordButton(_ sender: Any) {
        if (currentPasswordTextField.text != newPasswordTextField.text) {
            PasswordsAreDifferent(with: nil, description: nil)
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    //funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func PasswordsAreDifferent(with title: String?, description: String?) {
        let alertController = UIAlertController(title: "Error", message: "Passwords are not the same", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) {action in alertController.dismiss(animated: true, completion: nil)}
        alertController.addAction(dismissAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
