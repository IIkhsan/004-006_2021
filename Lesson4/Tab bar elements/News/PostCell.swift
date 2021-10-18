//
//  PostCell.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 18.10.2021.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupTitleLable: UILabel!
    @IBOutlet weak var postTimeLabel: UILabel!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(post: Post) -> Void {
        groupImage.image = post.authImage
        groupTitleLable.text = post.authName
        postTimeLabel.text = post.postTime
        
        postTextLabel.text = post.postText
        photoImageView.image = post.postImage
        
    }

}
