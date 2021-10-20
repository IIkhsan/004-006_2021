//
//  SaverOfProfile.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 15.10.2021.
//


import Foundation

class SaverOfProfile {
    let validatorForEmail = ValidEmail()
    let validatorForPassword = ValidPassword()
    var checker: Int = 0
    func checkAllParametrs(email: String?, firstPassword: String?, secondPassword: String?, arrayOfUsers: [Person]) -> Bool{
        checker = 0
        if validatorForEmail.isValidEmail(email, arrayOfUsers: arrayOfUsers) {
            checker = 1
        } else {
            return false
        }
        if checker == 1 && validatorForPassword.isValidPassword(firstPassword: firstPassword ?? "", secondPassword: secondPassword ?? "") {
            return true
        }
        return false
    }
}
