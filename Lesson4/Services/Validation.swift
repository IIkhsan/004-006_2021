//
//  Validation.swift
//  Lesson4
//
//  Created by Руслан on 11.10.2021.
//

import Foundation

func isValidEmail(_ email: String) -> Bool {
    return NSRegularExpression("[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}").matches(email)
}

func isValidPassword(_ password: String) -> Bool {
    if password.count < 6 {
        return false
    }
    if NSRegularExpression("\\P{Latin}").matches(password.filter({ $0.isLetter })) {
        return false
    }
    return NSRegularExpression("[a-zA-Z0-9]*[0-9][a-zA-Z0-9]*").matches(password)
}

extension NSRegularExpression {
    
    convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern).")
        }
    }
    
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
    
}

protocol CanValidateData {
    
    func validate(fullName: String, email: String?, password: String?, confirmedPassword: String?) -> (String, String)?
}

extension CanValidateData {
    
    func validate(fullName: String, email: String?, password: String?, confirmedPassword: String?) -> (String, String)? {
        guard fullName.split(separator: " ").count > 1,
              fullName.count > 0 else {
            return ("Full name field is incorrect",
                    "Please enter your full name, separating the first and last names with a space")
        }
        if let email = email, !isValidEmail(email) {
            return ("email must be valid email", "Please try again")
        }
        if let password = password, let confirmedPassword = confirmedPassword {
            guard isValidPassword(password) else {
                return ("Weak password",
                        "Password must contain at least 6 characters in Latin only and at least 1 digit")
                
            }
            if password != confirmedPassword {
                return ("Password mismatch", "Please try again")
            }
        }
        return nil
    }
}
