//
//  AuthViewController.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class AuthViewController: UIViewController {
    // MARK: - properties
    // FIXME: change shouldAutoLogin to `false` to prevent autoSign in
    var shouldAutoLogin = true
    
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
        if shouldAutoLogin {
            authManager.silentLogin()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // cherry pick the segue to the main screen
        if segue.identifier == AppConstants.gotoMain {
            
            // guard against optional values
            guard let tabVC = segue.destination as? UITabBarController,
                  let sender = sender as? User,
                  let viewControllers = tabVC.viewControllers
            else { return }
            
            // show navigationBars
            navigationController?.navigationBar.isHidden = false
            
            // update all viewControllers that are userIdentifiable
            for viewController in viewControllers {
                if var viewController = viewController as? UserProtocol {
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
        
        if let emailError = Validator.shared.validateEmail(email) {
            errors.append(emailError)
            actions.append { [weak self] in
                self?.emailTextField.shake()
            }
        }
        if let passwordError = Validator.shared.validatePassword(password) {
            errors.append(passwordError)
            actions.append { [weak self] in
                self?.passwordTextField.shake()
            }
        }
        
        if errors.isEmpty {
            authManager.login(email: email, password: password)
        } else {
            Validator.shared.showError(errors.joined(separator: "\n\n"), from: self) {
                for action in actions {
                    action()
                }
            }
        }
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
            performSegue(withIdentifier: AppConstants.gotoMain, sender: user)
        } else {
            Validator.shared.showError("Username or password is incorrect or user does not exist", from: self)
        }
    }
}
