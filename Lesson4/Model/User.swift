//
//  User.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//

class User{
    
    //    MARK: - Properties
    
    var username: String?
    var email: String?
    var password: String?
    
    
    //    MARK: - Init
    
    init(username:String, email:String, password:String) {
        self.username = username
        self.email = email
        self.password = password
    }
}
