//
//  PhoneNumberHelper.swift
//  Lesson4
//
//  Created by Artem Kalugin on 16.10.2021.
//

import Foundation

func isPhoneNumberValide(phoneNumber: String) -> Bool {
    let range = NSRange(location: 0, length: phoneNumber.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[0-9]{11}")
    let result = regex.firstMatch(in: phoneNumber, range: range)
    
    if result == nil {
        return false
    }
    
    return true
}

