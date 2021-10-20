//
//  ProfileTableViewCell.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 05.10.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    //MARK: - LABELS
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var textOfPost: UILabel!
    @IBOutlet weak var dateOfPostLabel: UILabel!
    
    //MARK: - IMAGE VIEWS
    @IBOutlet weak var imageOfPost: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    
    func configure(text: String, avatar: String, messageText: String, imagePost: String, dateOfPost: String) {
        avatarImage.image = UIImage(named: avatar)
        imageOfPost.image = UIImage(named: imagePost)
        nameOfPerson.text = text
        textOfPost.text = messageText
        avatarImage.layer.cornerRadius = avatarImage.frame.size.height / 2
        dateOfPostLabel.text = dateOfPost
    }
}
