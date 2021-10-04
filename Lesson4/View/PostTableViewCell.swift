//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 01.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var authorAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var isInit = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorAvatar.layer.cornerRadius = authorAvatar.frame.size.height / 2
        infoStackView.axis = .vertical
        infoStackView.spacing = 5
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func addSubview(text: String){
        let label = UILabel()
        label.text = text
        label.numberOfLines = 4
        
        infoStackView.addSubview(label)
        if !infoStackView.arrangedSubviews.contains(label){
            infoStackView.addArrangedSubview(label)
        }
    }
    
    func addSubview(image: UIImage){
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        
        if !infoStackView.arrangedSubviews.contains(imageView){
            infoStackView.addArrangedSubview(imageView)
        }
    }
    
    func configure(with post: Post){
        
        if isInit {return}
        
        self.authorAvatar.image = post.authorAvatar
        self.nameLabel.text = post.authorName
        
        if post.text != nil {
            addSubview(text: post.text!)
        }
        if post.image != nil {
            addSubview(image: post.image!)
        }
        isInit = true
        
    }
}

extension PostTableViewCell: CustomCell{
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
