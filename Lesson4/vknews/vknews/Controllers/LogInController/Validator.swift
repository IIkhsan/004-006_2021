//
//  Validator.swift
//  vknews
//
//  Created by itisioslab on 06.12.2021.
//

import Foundation

protocol ValidatorDelegate {
    
    func showValidationAlert(message: String)
}

class Validator {
    
    //    MARK: - Properties
    
    var delegate: ValidatorDelegate?
    
    
    //    MARK: - Regular Expressions
    
    private let emailRegex = #"^\S+@\S+\.\S+$"#
    private let passwordLengthRegex = #"(?=.{6,})"#
    private let passwordLatinRegex = #"(?=.*[a-zA-Z\d])"#
    private let passwordNumberRegex = #"(?=.*\d)"#
    
    
    //    MARK: - Validation functions
    
    func validateEmail(_ email:String) -> Bool {
        guard let delegate = delegate else { return false }
        
        if email == "" {
            delegate.showValidationAlert(message: "Поле почты не должно быть пустым")
            return false
        }
        
        if email.range(of: emailRegex, options: .regularExpression) == nil {
            delegate.showValidationAlert(message: "Почта должна содержать спец. символы")
            return false
        }
        
        return true
    }
    
    func validatePassword(_ password:String) -> Bool {
        
        guard let delegate = delegate else { return false }
        
        if password == "" {
            delegate.showValidationAlert(message: "Поле пароля не должно быть пустым")
            return false
        }
        
        if password.range(of: passwordLengthRegex, options: .regularExpression) == nil {
            delegate.showValidationAlert(message: "Пароль должен состоять как минимум из 6 символов")
            return false
        }
        
        if password.range(of: passwordNumberRegex, options: .regularExpression) == nil {
            delegate.showValidationAlert(message: "Пароль должен содержать как минимум одну цифру")
            return false
        }
        
        if password.range(of: passwordLatinRegex, options: .regularExpression) == nil {
            delegate.showValidationAlert(message: "Пароль должен содержать только криллицу(английские буквы)")
            return false
        }
        
        return true
    }
    
}
