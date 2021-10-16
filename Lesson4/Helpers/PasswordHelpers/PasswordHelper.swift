//
//  PasswordHelper.swift
//  Lesson4
//
//  Created by Artem Kalugin on 16.10.2021.
//

import Foundation

func isPasswordValide(password: String) -> Bool {
    let range = NSRange(location: 0, length: password.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[A-Za-z0-9!#$%&'*+-/=?^_`{|}~]{6,128}")
    let result = regex.firstMatch(in: password, range: range)
    
    let rangeOfDigits = password.rangeOfCharacter(from: CharacterSet.decimalDigits)

    if result == nil || rangeOfDigits == nil {
        return false
    }
    
    return true
}
