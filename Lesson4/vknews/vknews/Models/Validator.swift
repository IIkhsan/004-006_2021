//
//  Validator.swift
//  vknews
//
//  Created by itisioslab on 28.09.2021.
//

import UIKit

protocol ValidatorDelegate {
    
    func showAlert(message: String)
}

class Validator {
    
    
    //    MARK: - Properties
    
    var delegate: ValidatorDelegate?
    
    
    //    MARK: - Regular Expressions
    
    private let emailRegex = #"^\S+@\S+\.\S+$"#
    private let passwordLengthRegex = #"(?=.{6,})"#
    private let passwordLatinRegex = #"(?=.*[a-zA-Z\d])"#
    private let passwordNumberRegex = #"(?=.*\d)"#
    
    
    //    MARK: - Functions
    
    func validateEmail(_ email:String) -> Bool{
        guard let delegate = delegate else {return false}
        
        if email == "" {
            delegate.showAlert(message: "Email cannot be empty!")
            return false
        }
        
        if email.range(of: emailRegex, options: .regularExpression) == nil {
            delegate.showAlert(message: "Email is invalid!")
            return false
        }
        
        return true
    }
    
    func validatePassword(_ password:String) -> Bool{
        
        guard let delegate = delegate else {return false}
        
        if password == "" {
            delegate.showAlert(message: "Password cannot be empty!")
            return false
        }
        
        if password.range(of: passwordLengthRegex, options: .regularExpression) == nil {
            delegate.showAlert(message: "Passwords should be not less than 6 characters!")
            return false
        }
        
        if password.range(of: passwordNumberRegex, options: .regularExpression) == nil {
            delegate.showAlert(message: "Password should contain at least 1 number!")
            return false
        }
        
        if password.range(of: passwordLatinRegex, options: .regularExpression) == nil {
            delegate.showAlert(message: "Password should only contain latin characters and numbers!")
            return false
        }
        
        return true
    }
    
}
