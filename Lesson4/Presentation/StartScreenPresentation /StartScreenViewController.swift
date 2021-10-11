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
    
    // MARK: - Button actions
    @IBAction func signInButtonAction(_ sender: Any) {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        let userKey = [login, password]
        
        for key in db.keys {
            if key[0] == userKey[0], key[1] == userKey[1] {
                performSegue(withIdentifier: "TabBarSegue", sender: nil)
                userNow = db[userKey] ?? User(firstName: "", secondName: "", nickname: "", number: "", placeOfWork: "", town: "", avatar: "")
            }
        }
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "RegistrationViewController") as! RegistrationViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
