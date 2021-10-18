//
//  LoginService.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 13.10.2021.
//

import UIKit

final class LoginService {
    
    /// Property
    var data: [() -> Profile] = []
    
    func addNewProfile(completion: @escaping (() -> Profile)) {
        data.append(completion)
    }
    
    func generateData() {
        addNewProfile {
            return Profile(id: 1, login: "a@l.ru", password: "admin1", image: UIImage(named: "14"), name: "Даниил", status: "Все хорошо", city: "Казань", education: "КФУ", number: "+79832123", work: "Нет", maritalStatus: "Нет", hometown: "Нк")
        }
        
        addNewProfile {
            return Profile(id: 2, login: "b@l.ru", password: "admin1", image: UIImage(named: "15"), name: "Артем", status: "Все хорошо", city: "Казань", education: "КФУ", number: "+79832123", work: "Нет", maritalStatus: "Нет", hometown: "Нк")
        }
        addNewProfile {
            return Profile(id: 3, login: "c@l.ru", password: "admin1", image: UIImage(named: "17"), name: "Роман", status: "Все хорошо", city: "Казань", education: "КФУ", number: "+79832123", work: "Нет", maritalStatus: "Нет", hometown: "Нк")
        }
    }
}
