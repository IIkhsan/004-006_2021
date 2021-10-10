//
//  PostViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 10.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        guard let post = post else { return }
        accountImage.image = post.user.accountImage
        usernameLabel.text = post.user.username
        accountNameLabel.text = post.user.accountName
        postTextLabel.text = post.postText
        dateLabel.text = post.postDate
        postImageView.image = post.postImage
        makeImageViewRound(image: accountImage)
    }
    
    func makeImageViewRound(image: UIImageView) {
            image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
    


}
