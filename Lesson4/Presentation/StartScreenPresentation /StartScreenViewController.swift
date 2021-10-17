//
//  StartScreenViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 01.10.2021.
//

import UIKit

class StartScreenViewController: UIViewController {
    // Outlet properties
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Button actions
    @IBAction func signInButtonAction(_ sender: Any) {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let userKey = [login, password]
        var isExist = false
        
        for key in db.keys {
            if key[0] == userKey[0], key[1] == userKey[1] {
                performSegue(withIdentifier: "TabBarSegue", sender: nil)
                userNow = db[userKey] ?? User(id: 0, firstName: "", secondName: "", nickname: "", number: "", placeOfWork: "", town: "", avatar: "")
                isExist = true
            }
        }
        
        if !isExist {
            showAlert(title: "Sign in alert", description: "Incorrect login or password!")
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Private functions
    private func showAlert(title: String, description: String) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Close", style: .destructive) { action in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(dismissAction)
        present(alertController, animated: true, completion: nil)
    }
}
