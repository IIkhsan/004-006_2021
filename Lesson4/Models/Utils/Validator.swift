//
//  Validators.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 17.10.2021.
//

import UIKit

struct Validator {
    
    private init() {}
    
    // using singleton to prevent performance issues with `NSRegularExpression`
    public static let shared = Validator()
    
    // password regex singleton
    private let passwordRegex = try! NSRegularExpression(pattern: "\\P{Latin}")
   
    
    /// returns an error text if invalid else nil
    public func validateEmail(_ email: String) -> String? {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        ? nil : "Invalid email address"
    }
    
    /// returns an error text if invalid else nil
    public func validatePassword(_ password: String) -> String? {
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
    public func showError(_ error: String,
                          from viewController: UIViewController,
                          completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: completion)
    }
}
