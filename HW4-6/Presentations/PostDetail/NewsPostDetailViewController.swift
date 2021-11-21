//
//  NewsPostDetailViewController.swift
//  HW4-6
//
//  Created by Arslan Rashidov on 15.11.2021.
//

import UIKit

class NewsPostDetailViewController: UIViewController {

    // MARK: - UI
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var textLabel: UILabel!

    
    var newsPost: newsPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let newsPost = newsPost else {
            return
        }
        configure(newsPost: newsPost)
    }
    
    func configure(newsPost: newsPost) {
        textLabel.text = newsPost.text
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.minimumScaleFactor = 0.5
        photoImageView.image = newsPost.image
    }
}
