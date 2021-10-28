//
//  Validator.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 13.10.2021.
//

import Foundation

protocol ValidationService {
    func isValidPassword(_ password: String?) -> Bool
    func isValidEmail(_ email: String?) -> Bool
    func isRightData(_ email: String?, _ password: String?) -> User?
}

class Validator: ValidationService {
    // MARK: - Properties
    private let passwordRegularExpressionPattern = "^[a-zA-Z0-9]*[0-9][a-zA-Z0-9]*$"
    private let latainCharacterRegularExpressionPattern = "\\P{Latin}"
    private let emailRegualerExpressionPattern = "^(?:[a-z0-9!#$%&'*+\\/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+\\/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
    
    private let users: [User]
    
    // Dependencies
    private let dataManager = DataManager()
    
    // MARK: - Init
    init() {
        users = dataManager.generateUsersWithoutTime()
    }
    
    // MARK: - Validation's methods
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        do {
            let range = NSRange(location: 0, length: email.utf16.count)
            let regularExpression = try NSRegularExpression(pattern: emailRegualerExpressionPattern)
            return regularExpression.firstMatch(in: email, options: [], range: range) != nil
        } catch {
            print("NSRegularExpression Error")
            return false
        }
    }

    func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        if password.count < 6 { return false }
        do {
            let containsOnlyLatinChars = password.range(of: "\\P{Latin}", options: .regularExpression)
            let range = NSRange(location: 0, length: password.utf16.count)
            let regularExpression = try NSRegularExpression(pattern: passwordRegularExpressionPattern)
            let containsRegularExpression = regularExpression.firstMatch(in: password, options: [], range: range)
            return containsOnlyLatinChars != nil && containsRegularExpression != nil
        } catch {
            print("NSRegularExpression Error")
            return false
        }
    }
    
    func isRightData(_ email: String?, _ password: String?) -> User? {
        guard let email = email, let password = password else { return nil }
        for user in users {
            if user.email == email && user.password == password {
                return user
            }
        }
        return nil
    }
}
