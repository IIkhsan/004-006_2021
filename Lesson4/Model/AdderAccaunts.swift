//
//  AdderAccaunts.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 09.11.2021.
//

import Foundation
import UIKit

class AdderAccaunts {
    
    func addAccaunt(personsArray: [Person]) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(personsArray), forKey: "personsArray")
    }
    
    func prepareForWork() {
        if let data = UserDefaults.standard.object(forKey: "personsArray") as? Data {
            ViewController.arrayOfUsers = try! PropertyListDecoder().decode(Array<Person>.self, from: data)
        }
    }
}
