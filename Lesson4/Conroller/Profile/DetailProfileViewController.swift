//
//  DetailProfileViewController.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 05.10.2021.
//

import UIKit

class DetailProfileViewController: UIViewController {
    
    //MARK: - LABELS
    @IBOutlet weak var nameHowPost: UILabel!
    @IBOutlet weak var textOfPost: UILabel!
    @IBOutlet weak var daeOfPost: UILabel!
    
    //MARK: - IMAGE VIEWS
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var imageOfPost: UIImageView!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.image = UIImage(named: post?.avatar ?? "1")
        avatar.layer.cornerRadius = avatar.frame.size.height / 2
        nameHowPost.text = post?.name
        textOfPost.text = post?.textOfPost
        imageOfPost.image = UIImage(named: post?.imageOfOfPost ?? "1")
        daeOfPost.text = post?.datePost
    }
}
