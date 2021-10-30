//
//  RegistrationViewController.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 03.10.2021.
//

import UIKit

class InitialViewController: UIViewController {
    
    //MARK: - Actions
    @IBAction func signupAction(_ sender: Any) {
    }
    
    @IBAction func signinAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        navigationController?.pushViewController(loginViewController!, animated: true)
    }
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
