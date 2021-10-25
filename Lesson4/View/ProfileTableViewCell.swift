//
//  ProfileTableViewCell.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 20.10.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - Outlet Properties
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    // MARK: - Properties
    var user: User!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with user: User) {
        self.user = user
        editButton.layer.cornerRadius = editButton.layer.frame.height / 2
        avatarImage.layer.cornerRadius = avatarImage.layer.frame.height / 2
        statusLabel.text = user.status
        avatarImage.image = user.avatarImage
        educationLabel.text = "Education: \(user.education)"
        followersLabel.text = "Followers: \(user.followersNumber)"
        friendsLabel.text = "Friends: \(user.friendNum)"
    }
}

// MARK: - Realization protocol CustomCell
extension ProfileTableViewCell: CustomCell{
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
