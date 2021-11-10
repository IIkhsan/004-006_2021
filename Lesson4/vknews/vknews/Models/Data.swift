//
//  peopleData.swift
//  vknews
//
//  Created by itisioslab on 11.10.2021.
//

import UIKit

struct Accounts {
    var name: String
    var avatar: UIImage
    var newsBundle: [SinglePostCellData]
}

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
