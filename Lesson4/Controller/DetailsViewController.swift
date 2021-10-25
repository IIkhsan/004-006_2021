//
//  DetailsViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 17.10.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - Outlets properties
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorAvatarImage: UIImageView!
    
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    // MARK: - Properties
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    func configureView() {
        authorAvatarImage.image = post.authorAvatar
        authorNameLabel.text = post.authorName
        
        authorAvatarImage.layer.cornerRadius = authorAvatarImage.layer.frame.height / 2
        
        if post.text != nil {
            postTextLabel.text = post.text
        } else {
            postTextLabel.isHidden = true
        }
        if post.image != nil {
            postImageView.image = post.image
        } else {
            postImageView.isHidden = true
        }
    }
}
