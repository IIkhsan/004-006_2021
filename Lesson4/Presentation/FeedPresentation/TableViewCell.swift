//
//  TableViewCell.swift
//  Lesson4
//
//  Created by i.ikhsanov on 28.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var customImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(image: String?, description: String?) {
        if let image = image {
            print(image)
            descriptionLabel.isHidden = true
        } else {
            descriptionLabel.text = description
            customImageView.isHidden = true
        }
        
    }
}
