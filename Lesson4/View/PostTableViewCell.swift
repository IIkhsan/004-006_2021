//
//  PostTableViewCell.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 01.10.2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Outlet Properties
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var authorAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    var isInit = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorAvatar.layer.cornerRadius = authorAvatar.frame.size.height / 2
        infoStackView.spacing = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func addSubview(text: String){
        let label = UILabel()
        label.text = text
        label.numberOfLines = 4
        
        if !infoStackView.arrangedSubviews.contains(label){
            infoStackView.addArrangedSubview(label)
        }
    }
    
    func addSubview(image: UIImage){
        let imageView = UIImageView(image: image);
        
        let ratio = image.size.width / image.size.height
        if imageView.frame.width > imageView.frame.height {
            let newHeight = self.frame.height / ratio
            imageView.frame.size = CGSize(width: self.frame.width, height: newHeight)
        }
        else{
            let newWidth = self.frame.width * ratio
            imageView.frame.size = CGSize(width: newWidth, height: self.frame.height)
        }
        
        imageView.clipsToBounds = true
        if !infoStackView.arrangedSubviews.contains(imageView){
            infoStackView.addArrangedSubview(imageView)
        }
    }
    
    func configure(with post: Post){
        if isInit { return }
        
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

// MARK: - Realization protocol CustomCell
extension PostTableViewCell: CustomCell{
    static func cellIdentifier() -> String {
        return String(describing: self)
    }
    
    static func cellNib() -> UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}

// MARK: - Extension to resize image in post
extension UIImageView{
    open override var intrinsicContentSize: CGSize {
        
        if let myImage = image {
            let myImageWidth = myImage.size.width
            let myImageHeight = myImage.size.height
            let myViewWidth = frame.size.width
            
            let ratio = myViewWidth / myImageWidth
            let scaledHeight = myImageHeight * ratio
            
            return CGSize(width: myViewWidth, height: scaledHeight)
        }
        
        return CGSize(width: -1.0, height: -1.0)
    }
}
