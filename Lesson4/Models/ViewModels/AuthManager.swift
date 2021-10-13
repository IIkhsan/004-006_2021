//
//  LoginService.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import Foundation


// MARK: - AuthManagerDelegate
//
protocol AuthManagerDelegate {
    
    /// action that should be performed to start the loader when authentication starts
    func startLoading(_ manager: AuthManager)
    
    /// action that should be performed to stop the loader when authentication has finished
    func stopLoading(_ manager: AuthManager)
    
    /// action that should be performed when authentication has completed and user has logged in
    /// `user` is null if user was not found
    func authenticated(_ manager: AuthManager, as user: User?)
    
    /// action that should be performed when validation fails
    func validatedWithError(_ manager: AuthManager, error: String)
    
}


// MARK: - AuthManager struct [ViewModel]
struct AuthManager {
    
    // MARK: properties
    var delegate: AuthManagerDelegate?
    private let authService = AuthService()
    
    // MARK: public functions
    func silentLogin() {
        delegate?.startLoading(self)
        
        K.delay(bySeconds: 0.5) {
            
            let user = authService.silentLogin()
            
            // update on the main thread
            DispatchQueue.main.async {
                delegate?.stopLoading(self)
                delegate?.authenticated(self, as: user)
            }
        }
    }
    
    /// updates `AuthManagerDelegate`
    func login(email: String, password: String) {
        
        // validations
        if let emailError = validateEmail(email) {
            delegate?.validatedWithError(self, error: emailError)
            return
        }
        
        if let passwordError = validatePassword(password) {
            delegate?.validatedWithError(self, error: passwordError)
            return
        }
        
        // fetching data started
        delegate?.startLoading(self)
        
        // mock internet connection
        K.delay(bySeconds: 1.5, closure: {
            // get data and return user
            let user = authService.login(email: email, password: password)
            
            // update the delegate on the main thread
            DispatchQueue.main.async {
                delegate?.stopLoading(self)
                delegate?.authenticated(self, as: user)
            }
        })
        
        
    }
    
    private func validateEmail(_ email: String) -> String? {
        return nil
    }
    
    private func validatePassword(_ password: String) -> String? {
        return nil
    }
}
