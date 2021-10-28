//
//  Validator.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation

class Validator {
    
    // MARK: - Public functions
    public static func isEmailValid(_ email: String) -> Bool {
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", ".+.@..+")
        
        return emailTest.evaluate(with: email)
    }
    
    public static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[0-9])(?=.*)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z.*]{6,}")
        
        return passwordTest.evaluate(with: password)
    }
}
