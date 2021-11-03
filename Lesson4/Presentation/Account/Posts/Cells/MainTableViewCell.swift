//
//  MainTableViewCell.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 27.10.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    //MARK: - Functions
    func setData(user: User) {
        avatarImageView.image = user.profileImage
        nameLabel.text = user.name
        if user.status != nil {
            statusLabel.text = user.status
        } else {
            statusLabel.text = "Восславь Солнце!"
        }
    }
}

//MARK: - TableViewCellDelegate
extension MainTableViewCell: TableViewCellDelegate {
    func didDataChange(user: User) {
        setData(user: user)
    }
}
