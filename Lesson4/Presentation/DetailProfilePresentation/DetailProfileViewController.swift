//
//  DetailProfileViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 06.10.2021.
//

import UIKit

class DetailProfileViewController: UIViewController {
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var placeOfWorkLabel: UILabel!
    @IBOutlet weak var townLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        nicknameLabel.text = userNow.nickname
        firstNameLabel.text = userNow.firstName
        secondNameLabel.text = userNow.secondName
        placeOfWorkLabel.text = userNow.placeOfWork
        townLabel.text = userNow.town
        numberLabel.text = userNow.number
    }
}
