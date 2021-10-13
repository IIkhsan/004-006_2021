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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // cherry pick the segue to the main screen
        if segue.identifier == K.gotoMain {
            
            // guard against optional values
            guard let tabVC = segue.destination as? UITabBarController,
                  let sender = sender as? User,
                  let viewControllers = tabVC.viewControllers
            else { return }
            
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
        authManager.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    // MARK: - Helper functions
    private func showError(_ error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
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
    
    func validatedWithError(_ manager: AuthManager, error: String) {
        showError(error)
    }
    
    
}
