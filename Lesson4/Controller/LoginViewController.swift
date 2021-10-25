//
//  LoginViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 30.09.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    // MARK: - Outlet properties
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Properties
    var users: [User] = []
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.layer.cornerRadius = loginTextField.layer.frame.height / 2
        passwordTextField.layer.cornerRadius = passwordTextField.layer.frame.height / 2
        loginButton.layer.cornerRadius = loginButton.layer.frame.height / 8
        
        prepareUsers()
    }
    
    // MARK: - Check data and navigation
    @IBAction func loginAction(_ sender: Any) {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        // Minimum 6 characters at least 1 Alphabet and 1 Number REGEX
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{6,}$"
        
        guard let login = loginTextField.text,
        let password = passwordTextField.text else { return print("error") }
        
        if login ~= emailRegex && password ~= passwordRegex {
            
            guard let user = users.filter({ $0.login == login }).first else {
                let alert = UIAlertController(title: "Error", message: "User not found", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true)
                return }
            
            if user.password == password {
                performSegue(withIdentifier: "TabBarController", sender: user)
                print("performed segue to tabbar")
            } else {
                let alert = UIAlertController(title: "Error", message: "Wrong password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true)
            }
        }
        
        let alert = UIAlertController(title: "Error", message: "Regex Error", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
    // MARK: - Get users
    private func prepareUsers() {
        dataManager.createDefaultUsers { [weak self] users in
            guard let self = self else { return }
            self.users = users
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TabBarController", let user = sender as? User {
            let destinationController = segue.destination as? TabBarController
            destinationController?.user = user
        }
    }
}
