//
//  ImagesCollectionViewCell.swift
//  Lesson4
//
//  Created by Руслан on 07.10.2021.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = String(describing: ImagesCollectionViewCell.self)
    
}
