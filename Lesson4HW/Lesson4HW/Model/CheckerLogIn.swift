//
//  CheckerLogIn.swift
//  Lesson4HW
//
//  Created by Тимур Миргалиев on 15.10.2021.
//

import Foundation
import UIKit

class CheckerLogIn {
    func checker(login: String?, password: String?) -> Bool {
        if let data = UserDefaults.standard.object(forKey: "personsArray") as? Data {
            ViewController.arrayOfUsers = try! PropertyListDecoder().decode(Array<Person>.self, from: data)
        }
        print(ViewController.arrayOfUsers)
        for person in ViewController.arrayOfUsers {
            if login == person.number && password == person.password {
                ViewController.personHowLogIn.removeAll()
                ViewController.personHowLogIn.append(Person.init(number: login!, password: password!, name: person.name))
                return true
            }
        }
        return false
    }
}
