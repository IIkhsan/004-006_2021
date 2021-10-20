//
//  Generator.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 12.10.2021.
//

import Foundation
import UIKit

class GeneratorForProfile {
    let arrayOfSchool: [String] = ["Школа №1", "Школа №2", "Школа №3", "КФУ", "Школа №4", "Школа №5"]
    let arrayOfTowns: [String] = ["Москва", "Казань", "Тюмень", "Уфа", "Ростов", "Кубань", "Тобольск"]
    
    func generateProfile(name: UILabel, town: UILabel, school: UILabel, folowers: UILabel, webStatus: UILabel, avatar: UIImageView, imageForAvatar: String) {
        name.text = ViewController.personHowLogIn[0].name
        town.text = "Город: " + arrayOfTowns.randomElement()!
        school.text = "Образование: " + arrayOfSchool.randomElement()!
        folowers.text = "\(Int.random(in: 1..<999)) подписчиков"
        webStatus.text = "Online"
        avatar.image = UIImage(named: imageForAvatar)
        avatar.layer.cornerRadius = avatar.frame.height / 2
    }
}
