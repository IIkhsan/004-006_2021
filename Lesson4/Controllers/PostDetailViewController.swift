//
//  StudentDetailViewController.swift
//  Lesson3
//
//  Created by i.ikhsanov on 21.09.2021.
//

import UIKit


class PostDetailViewController: UIViewController {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postTextView: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    //    MARK: - Properties
    
    var post: Post?
    
    
    //    MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        let contentRect: CGRect = scrollView.subviews.reduce(into: .zero) { rect, view in
            rect = rect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    
    //    MARK: - Init
    
    private func configure() {
        guard let post = post else { return }
        userNameLabel.text = post.authorUsername
        userImage.image = post.authorImage
        postTextView.text = post.text
        postTextView.sizeToFit()
        postImage.image = post.image
    }
}
