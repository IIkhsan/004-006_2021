//
//  LogInModel.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 13.10.2021.
//

import Foundation
class LogInModel {
    
    //MARK: - Properties
    let emailPattern = #"^\S+@\S+\.\S+$"#
    private let lengthPattern: String =  #"(?=.{6,})"#
    private let latinSymbolsOnlyPattern: String = "[a-zA-Z0-9]"
    private let oneDigitSymbolPattern: String =  #"(?=.*\d)"#
    
    //MARK: - Public functions
    func validateLogin(login: String) -> Bool {
        do {
        let regex = try NSRegularExpression(pattern: emailPattern, options: .caseInsensitive)
            let range = NSRange(location: 0, length: login.utf16.count)
            return regex.firstMatch(in: login, options: [], range: range) != nil
        } catch {
            return false
        }
    }
    
    func validatePassword(password: String) -> (isValid: Bool, errorMsg: String?) {
        do {
            if password == "" {
                return (false, "Please, enter password")
            }
            let range = NSRange(location: 0, length: password.utf16.count)
            let regexLength = try NSRegularExpression(pattern: lengthPattern, options: [])
            if regexLength.firstMatch(in: password, options: [], range: range) == nil {
                print(false)
                return (false, "Password must be longer than 6 symbols")
            }
            print(true)
            let regexLatinSymbols = try NSRegularExpression(pattern: latinSymbolsOnlyPattern, options: [])
            if regexLatinSymbols.firstMatch(in: password, options: [], range: range) == nil {
                return (false, "Password must contain only latin symbols")
            }
            let regexOneDigit = try NSRegularExpression(pattern: oneDigitSymbolPattern, options: [])
            if regexOneDigit.firstMatch(in: password, options: [], range: range) == nil {
                return (false, "Password must contain at least one digit")
            }
            return (true, nil)
        }
        catch {
            return (false, nil)
        }
    }
}
