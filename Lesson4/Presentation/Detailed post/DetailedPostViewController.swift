//
//  DetailedPostViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class DetailedPostViewController: UIViewController {
    // MARK: - UI
    @IBOutlet weak var authorAvatarImageView: UIImageView!
    @IBOutlet weak var authorNameTextLabel: UILabel!
    @IBOutlet weak var mainTextLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTextStackView: UIStackView!
    
    // MARK: - Properties
    var post: Post?

    // MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Private
    private func configure() {
        guard let post = post else { return }
        authorNameTextLabel.text = post.author.name
        authorAvatarImageView.image = post.author.avatar
        
        if post.image == nil {
            mainImageView.isHidden = true
        } else {
            mainImageView.image = post.image
        }
        
        if post.text == nil {
            mainTextStackView.isHidden = true
        } else {
            mainTextLabel.text = post.text
        }
    }
}
