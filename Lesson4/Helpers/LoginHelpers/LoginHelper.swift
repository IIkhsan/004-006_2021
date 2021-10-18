//
//  LoginHelper.swift
//  Lesson4
//
//  Created by Artem Kalugin on 16.10.2021.
//

import Foundation

func isLoginValide(login: String) -> Bool {
    let range = NSRange(location: 0, length: login.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    let result = regex.firstMatch(in: login, range: range)
    
    if result == nil {
        return false
    }
    
    return true
}

