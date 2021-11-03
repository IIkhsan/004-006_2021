//
//  InfoTableViewCell.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 27.10.2021.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var subscribersLabel: UILabel!
    
    //MARK: - Functions
    func setData(user: User) {
        cityLabel.text = "Город: \(user.city)"
        subscribersLabel.text = "\(user.subscribers) подписчиков"
    }

}

//MARK: - TableViewCellDelegate
extension InfoTableViewCell: TableViewCellDelegate {
    func didDataChange(user: User) {
        setData(user: user)
    }
}
