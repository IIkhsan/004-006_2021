//
//  peopleData.swift
//  vknews
//
//  Created by itisioslab on 11.10.2021.
//

import UIKit

class UserService {
    
    private var users: [Account]
    
    init() {
        users = [.init(authentification: LogInfo1, username: "badgalriri", profilePicture: #imageLiteral(resourceName: "1613768")),
                 .init(authentification: LogInfo2, username: "egorkreed", profilePicture: #imageLiteral(resourceName: "ff681219b653530b1f0b1d63c292bd29"))]
    }
    
    func getUser(email: String, password: String) -> Account? {
        var user = users.filter { $0.authentification.email == email && $0.authentification.password == password }
        
        if !user.isEmpty { return user.removeFirst() }
        
        return nil
    }
}