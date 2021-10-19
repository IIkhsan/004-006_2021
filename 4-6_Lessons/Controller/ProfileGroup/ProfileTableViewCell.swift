//
//  ProfileTableViewCell.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 10.10.2021.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // Outlets
    
    @IBOutlet weak var profilePostFirstImageView: UIImageView!
    @IBOutlet weak var profilePostSecondImageView: UIImageView!
    @IBOutlet weak var profilePostThirdImageView: UIImageView!
    
    // MARK: - View life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Public func configure
    
    func configureProfileTableViewCell(with profilePost: ProfilePost) {
        switch(true) {
        case (profilePost.profilePostFirstImage == nil) && (profilePost.profilePostSecondImage != nil) && (profilePost.profilePostThirdImage != nil):
            profilePostFirstImageView.isHidden = true
            profilePostSecondImageView.isHidden = true
            profilePostThirdImageView.image = profilePost.profilePostThirdImage
        case (profilePost.profilePostFirstImage != nil) && (profilePost.profilePostSecondImage == nil) && (profilePost.profilePostThirdImage != nil):
            profilePostFirstImageView.image = profilePost.profilePostFirstImage
            profilePostSecondImageView.isHidden = true
            profilePostThirdImageView.image = profilePost.profilePostThirdImage
        case (profilePost.profilePostFirstImage != nil) && (profilePost.profilePostSecondImage != nil) && (profilePost.profilePostThirdImage == nil):
            profilePostFirstImageView.image = profilePost.profilePostFirstImage
            profilePostSecondImageView.image = profilePost.profilePostSecondImage
            profilePostThirdImageView.isHidden = true
        case (profilePost.profilePostFirstImage == nil) && (profilePost.profilePostSecondImage == nil) && (profilePost.profilePostThirdImage != nil):
            profilePostFirstImageView.isHidden = true
            profilePostSecondImageView.isHidden = true
            profilePostThirdImageView.image = profilePost.profilePostThirdImage
        case (profilePost.profilePostFirstImage == nil) && (profilePost.profilePostSecondImage != nil) && (profilePost.profilePostThirdImage == nil):
            profilePostFirstImageView.isHidden = true
            profilePostSecondImageView.image = profilePost.profilePostSecondImage
            profilePostThirdImageView.isHidden = true
        case (profilePost.profilePostFirstImage != nil) && (profilePost.profilePostSecondImage == nil) && (profilePost.profilePostThirdImage == nil):
            profilePostFirstImageView.image = profilePost.profilePostFirstImage
            profilePostSecondImageView.isHidden = true
            profilePostThirdImageView.isHidden = true
        default:
            profilePostFirstImageView.image = profilePost.profilePostFirstImage
            profilePostSecondImageView.image = profilePost.profilePostSecondImage
            profilePostThirdImageView.image = profilePost.profilePostThirdImage
        }
    }
}
