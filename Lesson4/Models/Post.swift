//
//  Post.swift
//  Lesson4
//
//  Created by Руслан on 13.10.2021.
//

import UIKit

struct Post {
    let accountLogo: UIImage?
    let accountName: String
    let date: Date
    let text: String?
    let image: UIImage?
    let dateFormatter = DateFormatter()
    
    var dateString: String {
        return dateFormatter.string(from: date)
    }

    init(accountLogo: UIImage?, accountName: String, dateStringISO8601: String?, text: String?, image: UIImage?) {
        self.accountLogo = accountLogo
        self.accountName = accountName
        self.text = text
        self.image = image
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        self.date = dateFormatter.date(from: dateStringISO8601 ?? "") ?? Date()
    }
}
