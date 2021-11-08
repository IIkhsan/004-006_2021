//
//  ValidPassword.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 15.10.2021.
//

import Foundation
import UIKit

class ValidPassword{
    
    func emailCheck(firstPassword: String, secondPassword: String) -> Bool{
        if similarPasswords(first: firstPassword, second: secondPassword) {
            let decimalCharacters = CharacterSet.decimalDigits
            
            let decimalRange = firstPassword.rangeOfCharacter(from: decimalCharacters)
            
            if decimalRange != nil {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func isValidPassword(firstPassword: String, secondPassword: String) -> Bool {
        if emailCheck(firstPassword: firstPassword, secondPassword: secondPassword) && firstPassword.count >= 6 {
            return true
        }
        return false
    }
    
    func similarPasswords(first: String?, second: String?) -> Bool{
        if first == second {
            return true
        } else {
            return false
        }
    }
}
