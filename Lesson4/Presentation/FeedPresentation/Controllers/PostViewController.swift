//
//  PostViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 05.10.2021.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func configure(avatarImage: String, name: String, postInfo: String, postImage: String, postText: String){
        if postImage == "" {
            self.postImage.image = nil
        } else {
            self.postImage.image = UIImage(named: postImage)
        }
        self.avatarImage.image = UIImage(named: avatarImage)
        nameLabel.text = name
        dateLabel.text = postInfo
        postTextLabel.text = postText
    }

    

}
