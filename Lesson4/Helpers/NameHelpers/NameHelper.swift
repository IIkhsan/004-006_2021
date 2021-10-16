//
//  NameHelper.swift
//  Lesson4
//
//  Created by Artem Kalugin on 16.10.2021.
//

import Foundation

func isNameValide(name: String) -> Bool {
    let range = NSRange(location: 0, length: name.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[a-zA-Z]{1,128}")
    let result = regex.firstMatch(in: name, range: range)
    
    if result == nil {
        return false
    }
    
    return true
}
