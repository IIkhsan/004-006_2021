//
//  PostTableViewCell.swift
//  vknews
//
//  Created by itisioslab on 28.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imagesLowPriorityConstraint: NSLayoutConstraint!
    @IBOutlet weak var image2Constraint: NSLayoutConstraint!
    @IBOutlet weak var image1Constraint: NSLayoutConstraint!
    @IBOutlet weak var lowPriorityConstraint: NSLayoutConstraint!
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var pubTimeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var postPicImageView1: UIImageView!
    @IBOutlet weak var postPicImageView2: UIImageView!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Function
    public func configure(post: SinglePostCellData) {
        groupImageView.image = post.groupImage
        groupNameLabel.text = post.groupName
        pubTimeLabel.text = post.publishingTime
        descriptionTextView.text = post.description
        postPicImageView1.image = nil
        postPicImageView2.image = nil
        if post.pinnedPics.count > 0 {
            postPicImageView1.image = post.pinnedPics[0]
        }
        else {
            lowPriorityConstraint.priority = UILayoutPriority(rawValue: 1000)
            image1Constraint.priority = UILayoutPriority(rawValue: 900)
            image2Constraint.priority = UILayoutPriority(rawValue: 900)
            imagesLowPriorityConstraint.priority = UILayoutPriority(rawValue: 1)
        }
        if post.pinnedPics.count > 1 {
           postPicImageView2.image = post.pinnedPics[1]
            image1Constraint.priority = UILayoutPriority(rawValue: 1000)
            image2Constraint.priority = UILayoutPriority(rawValue: 1000)
            lowPriorityConstraint.priority = UILayoutPriority(rawValue: 900)
            imagesLowPriorityConstraint.priority = UILayoutPriority(rawValue: 1)
        }
        if post.description == nil {
            image1Constraint.priority = UILayoutPriority(rawValue: 900)
            image2Constraint.priority = UILayoutPriority(rawValue: 900)
            lowPriorityConstraint.priority = UILayoutPriority(rawValue: 1)
            imagesLowPriorityConstraint.priority = UILayoutPriority(rawValue: 1000)
        }
    }
}
