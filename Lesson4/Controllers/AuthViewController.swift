//
//  AuthViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class AuthViewController: UIViewController {
    // MARK: - properties
    // FIXME: change autoLogin to `false` to prevent autoSign in
    var autoLogin = true
    
    // password regex singleton
    private let passwordRegex = try! NSRegularExpression(pattern: "\\P{Latin}")
    
    // MARK: - IBOutlets
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var loadingSpinner: UIActivityIndicatorView!
    @IBOutlet weak var bottomView: UIView!
    
    // MARK: - Managers
    var authManager = AuthManager()
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        authManager.delegate = self
        loadingSpinner.stopAnimating()
        if autoLogin {
            authManager.silentLogin()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // cherry pick the segue to the main screen
        if segue.identifier == K.gotoMain {
            
            // guard against optional values
            guard let tabVC = segue.destination as? UITabBarController,
                  let sender = sender as? User,
                  let viewControllers = tabVC.viewControllers
            else { return }
            
            // show navigationBars
            navigationController?.navigationBar.isHidden = false
            
            // update all viewControllers that are userIdentifiable
            for viewController in viewControllers {
                if var viewController = viewController as? UserIdentifiable {
                    viewController.user = sender
                }
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func onLoginPressed(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        // list of error texts
        var errors: [String] = []
        // list of actions to perform on error
        var actions: [() -> Void] = []
        
        if let emailError = validateEmail(email) {
            errors.append(emailError)
            actions.append { [weak self] in
                self?.emailTextField.shake()
            }
        }
        if let passwordError = validatePassword(password) {
            errors.append(passwordError)
            actions.append { [weak self] in
                self?.passwordTextField.shake()
            }
        }
        
        if errors.isEmpty {
            authManager.login(email: email, password: password)
        } else {
            showError(errors.joined(separator: "\n\n")) {
                for action in actions {
                    action()
                }
            }
        }
    }
    
    // MARK: - Helper functions
    
    /// returns an error text if invalid else nil
    private func validateEmail(_ email: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        ? nil : "Invalid email address"
    }
    
    /// returns an error text if invalid else nil
    private func validatePassword(_ password: String) -> String? {
        // minLength test
        if password.trimmingCharacters(in: .whitespacesAndNewlines).count < 6 {
            return "Password is too short, provide at least 6 characters"
        }
        
        // check for non-Latin alphabets among the letters
        let letters = password
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .filter{ $0.isLetter }
        let range = NSRange(location: 0, length: letters.count)
        if passwordRegex.firstMatch(in: letters, options: [], range: range) != nil {
            return "Password must contain only LATIN characters"
        }
        
        // check for at least digit
        guard password.contains(where: { character in
            character.isNumber
        }) else {
            return "Password must contain at least one digit"
        }
        
        return nil
    }
    
    /// shows an alertController with an error message
    private func showError(_ error: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: completion)
    }
}


// MARK: - AuthManagerDelegate
extension AuthViewController: AuthManagerDelegate {
    
    func startLoading(_ manager: AuthManager) {
        loadingSpinner.startAnimating()
        bottomView.alpha = 0.2
        
    }
    
    func stopLoading(_ manager: AuthManager) {
        loadingSpinner.stopAnimating()
        bottomView.alpha = 1
    }
    
    func authenticated(_ manager: AuthManager, as user: User?) {
        if let user = user {
            performSegue(withIdentifier: K.gotoMain, sender: user)
        } else {
            showError("Username or password is incorrect or user does not exist")
        }
    }
}
