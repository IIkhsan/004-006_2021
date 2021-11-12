//
//  Validator.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 12.11.2021.
//

import Foundation

class Validator {
    // MARK: - Private properties
    private let loginRegex = try! NSRegularExpression(pattern: "([a-z0-9]){1,64}@([a-z]){2,16}.([a-z]){2,16}")
    private let passwordRegex = try! NSRegularExpression(pattern: "([a-z0-9!*%+=-]){6,16}")
    
    // MARK: - Private function
    private func isValid (string: String?, regex: NSRegularExpression) -> Bool {
        
        var result: NSTextCheckingResult?
        let range = NSRange(location: 0, length: string?.utf16.count ?? 0)
        
        if let string = string {
            result = regex.firstMatch(in: string, range: range)
        }
        return result != nil
        
    }
    
    // MARK: - Validate functions
    func isValidLogin (login: String?) -> Bool {
        return isValid(string: login, regex: loginRegex)
        
    }
    
    func isValidPassword (password: String?) -> Bool {
        return isValid(string: password, regex: passwordRegex)
        
    }
    
}
