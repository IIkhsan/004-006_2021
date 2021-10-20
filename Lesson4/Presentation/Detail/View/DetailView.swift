//
//  DetailView.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 11.10.2021.
//

import UIKit

class DetailView: UIView {
    
    //MARK: - Properties
    private var layerManager: LayerManager = LayerManager()
    
    //MARK: - IBOutlets
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    
    //MARK: - Private functions 
    public func configure(post: Post?) {
        authorImageView.image = post?.authorImage
        authorNameLabel.text = post?.authorName
        dateLabel.text = post?.date.description
        contentLabel.text = post?.content
        contentImageView.image = post?.contentImage
        layerManager.makeViewRounded(view: authorImageView)
    }
}
