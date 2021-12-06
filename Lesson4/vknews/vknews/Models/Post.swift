//
//  PostData.swift
//  vknews
//
//  Created by itisioslab on 06.12.2021.
//

import UIKit

class SinglePostCellData {
    var groupName: String?
    var description: String?
    var groupImage: UIImage?
    var publishingTime: String?
    var pinnedPics: [UIImage?]
    
    init(groupName: String?, description: String?, groupImage: UIImage?, publishingTime: String?, pinnedPics: [UIImage?]) {
        self.groupName = groupName
        self.description = description
        self.groupImage = groupImage
        self.publishingTime = publishingTime
        self.pinnedPics = pinnedPics
    }
}
