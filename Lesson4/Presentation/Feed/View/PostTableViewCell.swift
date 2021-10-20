//
//  PostTableViewCell.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 04.10.2021.
//

//
//  PostWithImageTableViewCell.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    var post: Post?
    let layerManager = LayerManager()
    var isLikePressed = false
    weak var delegate: PostTableViewCellDelegate?
        
    //MARK: - IB Outlets
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
    //MARK: - IB Actions
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        isLikePressed = !isLikePressed
        if isLikePressed {
            delegate?.likeTapped(sender: self)
            likeButton.setImage(UIImage(named: "like_filled"), for: .normal)
            post?.likesCount += 1
        } else {
            delegate?.likeCanceled(sender: self)
            likeButton.setImage(UIImage(named: "like"), for: .normal)
            post?.likesCount -= 1
        }
        likeCountLabel.text = post?.likesCount.description
    }

    //MARK: - Cell methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: Public functions
    public func configure(post: Post) {
        self.post = post
        display(post: post)
        layerManager.makeViewRounded(view: authorImageView)
    }
    
    //MARK: - Private functions
    private func display(post: Post) {
        authorImageView.image = post.authorImage
        authorNameLabel.text = post.authorName
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY, MMM d"
        dateLabel.text = dateFormatter.string(from: post.date)
        contentLabel.text = post.content
        contentImageView.image = post.contentImage
        likeCountLabel.text = post.likesCount.description
    }
}
