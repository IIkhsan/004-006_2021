//
//  peopleData.swift
//  vknews
//
//  Created by itisioslab on 11.10.2021.
//

import UIKit

class UserService {
    
    // MARK: - Private property
    private var users: [Account]
    
    // MARK: - Initializer
    init() {
        users = [.init(authentification: LogInfo1, username: "badgalriri", bio: "", profilePicture: #imageLiteral(resourceName: "1613768")),
                 .init(authentification: LogInfo2, username: "egorkreed", bio: "", profilePicture: #imageLiteral(resourceName: "ff681219b653530b1f0b1d63c292bd29"))]
    }
    
    // MARK: - Function
    func getUser(email: String, password: String) -> Account? {
        var user = users.filter { $0.authentification.email == email && $0.authentification.password == password }
        
        if !user.isEmpty { return user.removeFirst() }
        
        return nil
    }
}
