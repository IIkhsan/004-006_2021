//
//  ProfileView.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 11.10.2021.
//

import UIKit

class ProfileView: UIView {
    
    //MARK: - Properties
    var layerManager: LayerManager = LayerManager()
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var subscribersCountLabel: UILabel!
    @IBOutlet weak var friendsCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var editStatusButton: UIButton!
    
    //MARK: - Public functions
    public func configureProfileHeaderView(user: User?) {
            avatarImageView.image = user?.avatarImage
        statusLabel.text = user?.status
            nameLabel.text = user?.name
            phoneNumberLabel.text = user?.phoneNumber
            cityLabel.text = "City: \(user?.city ?? "")"
            subscribersCountLabel.text = "Subscribers: \(user?.subscribersCount ?? 0)"
            friendsCountLabel.text = "Friends: \(user?.friendsCount ?? 0)"
            layerManager.makeViewRounded(view: avatarImageView)
    }
}
