//
//  FriendsListTableViewCell.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 18.10.2021.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var firstFriendImg: UIImageView!
    @IBOutlet weak var secondFriendImg: UIImageView!
    @IBOutlet weak var thirdFriendImg: UIImageView!
    
    // MARK: - IBOutlets
    override func awakeFromNib() {
        super.awakeFromNib()
        firstFriendImg.layer.cornerRadius = firstFriendImg.frame.height / 2
        secondFriendImg.layer.cornerRadius = secondFriendImg.frame.height / 2
        thirdFriendImg.layer.cornerRadius = secondFriendImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
