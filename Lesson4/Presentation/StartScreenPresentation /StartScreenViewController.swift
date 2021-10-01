//
//  StartScreenViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 01.10.2021.
//

import UIKit

class StartScreenViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signInButtonAction(_ sender: Any) {
        guard let login = loginTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        if login == "login", password == "password" {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(identifier: "FeedViewController") as! FeedViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
