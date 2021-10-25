//
//  AccountInformationTableViewCell.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class AccountInformationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var accountStatus: UILabel!
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var accountImg: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        accountImg.layer.cornerRadius = accountImg.frame.height  / 2
        editButton.layer.cornerRadius = 8
        
        let loggedInUser = User.all_users[User.loggedInUserId]
        
        accountImg.image = loggedInUser.profileImg
        accountName.text = loggedInUser.name
        accountStatus.text = loggedInUser.status
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
