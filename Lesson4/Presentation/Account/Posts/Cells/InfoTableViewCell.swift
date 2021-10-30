//
//  InfoTableViewCell.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 27.10.2021.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var subscribersLabel: UILabel!
    
    //MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    //MARK: - Functions
    func setData(user: User?) {
        cityLabel.text = "Город: \(user?.city ?? "Казань")"
        subscribersLabel.text = "\(user?.subscribers ?? 100) подписчиков"
    }

}

//MARK: - TableViewCellDelegate
extension InfoTableViewCell: TableViewCellDelegate {
    func didDataChange(user: User) {
        setData(user: user)
    }
}
