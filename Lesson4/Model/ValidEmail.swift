//
//  ValidEmail.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 15.10.2021.
//

import Foundation

class ValidEmail {
    func isValidEmail(_ email: String?, arrayOfUsers: [Person]) -> Bool {
        if isEmailFree(email: email, array: arrayOfUsers) {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        } else {
            return false
        }
    }
    
    func isEmailFree(email: String?, array: [Person]) -> Bool {
        for persons in arrayOfUsers {
            if email == persons.number {
                return false
            }
        }
        return true
    }
}
