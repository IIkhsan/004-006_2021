//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var postText: UILabel?
    @IBOutlet weak var postImg: UIImageView?
    @IBOutlet weak var postAccountImg: UIImageView!
    @IBOutlet weak var postAccountName: UILabel!
    @IBOutlet weak var postAccountStatus: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postAccountImg.layer.cornerRadius = postAccountImg.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
