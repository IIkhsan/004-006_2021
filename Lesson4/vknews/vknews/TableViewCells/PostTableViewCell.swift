//
//  PostTableViewCell.swift
//  vknews
//
//  Created by itisioslab on 28.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var image1HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var image3HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var image4HeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var pubTimeLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var postPicImageView1: UIImageView!
    @IBOutlet weak var postPicImageView2: UIImageView!
    @IBOutlet weak var postPicImageView3: UIImageView!
    @IBOutlet weak var postPicImageView4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func SetData(post: SinglePostCellData) {
        groupImageView.image = post.groupImage
        groupNameLabel.text = post.groupName
        pubTimeLabel.text = post.publishingTime
        descriptionTextView.text = post.description
        postPicImageView1.image = nil
        postPicImageView2.image = nil
        postPicImageView3.image = nil
        postPicImageView4.image = nil
        if post.pinnedPics.count <= 2 {
            image3HeightConstraint.constant = 0
            image4HeightConstraint.constant = 0
        }
        //if descriptionTextView.text.count > 60 {
            //image1HeightConstraint.constant = 0
        //}
        if post.pinnedPics.count > 0 {
            postPicImageView1.image = post.pinnedPics[0]
        }
        if post.pinnedPics.count > 1 {
           postPicImageView2.image = post.pinnedPics[1]
        }
        if post.pinnedPics.count > 2 {
            postPicImageView3.image = post.pinnedPics[2]
            postPicImageView4.image = post.pinnedPics[3]
        }
    }
}
