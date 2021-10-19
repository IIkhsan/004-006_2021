//
//  AccountInformationTableViewCell.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class AccountInformationTableViewCell: UITableViewCell {

    
    @IBOutlet weak var accountImg: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        accountImg.layer.cornerRadius = accountImg.frame.height  / 2
        editButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
