//
//  NicknameHelper.swift
//  Lesson4
//
//  Created by Artem Kalugin on 16.10.2021.
//

import Foundation

func isNicknameValide(nickname: String) -> Bool {
    let range = NSRange(location: 0, length: nickname.utf16.count)
    let regex = try! NSRegularExpression(pattern: "[A-Za-z0-9!#$%&'*+-/=?^_`{|}~]{4,64}")
    let result = regex.firstMatch(in: nickname, range: range)
    
    if result == nil {
        return false
    }
    
    return true
}

