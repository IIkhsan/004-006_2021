//
//  PostViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 05.10.2021.
//

import UIKit

class PostViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postTextLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    //MARK: - Vars
    var post: Post?
    //MARK: - UIViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDetails()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Post View Controller configuration methods
    /// Configure PostViewController's IBOutlets
    func configureDetails() {
        guard let post = post else { return }
        avatarImageView.image = UIImage(named: post.avatarImage)
        nameLabel.text = post.name
        dateLabel.text = post.date
        postTextLabel.text = post.text
        postImageView.image = UIImage(named: post.image)
        
    }
}
