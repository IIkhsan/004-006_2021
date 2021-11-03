//
//  PostViewController.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 20.10.2021.
//

import UIKit

class PostViewController: UIViewController {

    //MARK: - Properties
    var post: Post!
    var name: String?
    var avatar: UIImage?
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var avatarImageView: UIImageView?
    @IBOutlet weak var postImageView: UIImageView?
    @IBOutlet weak var postTextView: UITextView?
    @IBOutlet weak var scrollView: UIScrollView?

    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel?.text = name
        avatarImageView?.image = avatar
        
        if post.postText != nil {
            postTextView?.text = post.postText
        } else {
            postTextView?.text = ""
            scrollView?.isScrollEnabled = false
        }
        
        if post.postImage != nil {
            postImageView?.image = post.postImage
        } else {
            postImageView?.isHidden = true
        }
    }
    
    //MARK: - Functions
    func setUser(user: User) {
        name = user.name
        avatar = user.profileImage
    }
    
    func setUnknownUser() {
        name = "Случайный пользователь"
        avatar = UIImage(named: "friend1") ?? UIImage()
    }
}
