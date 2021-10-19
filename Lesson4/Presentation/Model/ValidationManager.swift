//
//  File.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 14.10.2021.
//

import UIKit

class ValidationManager {
    //MARK: - Validation methods
    
    /// Authorization validation
    /// - Parameters:
    ///   - login: User login string
    ///   - password: User password string
    ///   - controller: Controller that presents alert
    /// - Returns: If all checks passed – true, else – false
    func authorization(login: String, password: String, controller: UIViewController) -> Bool {
        for user in UserDatasource.users {
            if checkEmail(login: login, controller: controller) && checkPassword(password: password, controller: controller) {
                if login == user.login && password == user.password {
                    UserDatasource.currentUser = user
                    return true
                }
            }
        }
        
        let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль введены неверно. Пожалуйста проверьте введенные данные.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
        controller.present(alert, animated: true)
        return false
    }
    
    /// Email validation
    /// - Parameter login: String for checking
    /// - Returns: result of regular expression
    func checkEmail(login: String, controller: UIViewController) -> Bool{
        do {
            let range = NSRange(location: 0, length: login.utf16.count)
            let regex = try NSRegularExpression(pattern: "^([a-z0-9_-]+\\.)*[a-z0-9_-]+@[a-z0-9_-]+(\\.[a-z0-9_-]+)*\\.[a-z]{2,6}$")
            let result = regex.firstMatch(in: login, range: range) ?? nil
            if result == nil {
                let alert = UIAlertController(title: "Ошибка", message: "Логин не подходит. Пожалуйста проверьте введенные данные. Логин должен быть в формате name@example.com", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
                controller.present(alert, animated: true)
                return false
            } else {
                return true
            }
            
            
        } catch {
            
            print("NSRegularExpression Error")
            return false
        }
    }
    
    /// Password validation
    /// - Parameter password: String for checking
    /// - Returns: result of using regular expression on String password
    func checkPassword(password: String, controller: UIViewController) -> Bool{
        do {
            let range = NSRange(location: 0, length: password.utf16.count)
            let regex = try NSRegularExpression(pattern: "(?=.*[0-9])(?=.*[a-zA-Z])[0-9a-zA-Z]{6,}")
            let result = regex.firstMatch(in: password, range: range) ?? nil
            if result == nil {
                let alert = UIAlertController(title: "Ошибка", message: "Пароль не подходит. Пожалуйста проверьте введенные данные. Длина пароля должна быть не менее 6 символов, пароль должен содержать в себе хотя бы одну цифру и только латинские буквы", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "ОК", style: .cancel, handler: nil))
                controller.present(alert, animated: true)
                return false
            } else {
                return true
            }
            
        } catch {
            print("NSRegularExpression Error")
            return false
        }
    }
    
    
}
