//
//  FeedService.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 06.10.2021.
//

import UIKit

final class FeedService {
    
    /// Property
    var textArray: [String] = []
    var data: [() -> Post] = []
    var photos = ["6","7","8","9","10","11","12"]
    
    func addNewPost(completion: @escaping (() -> Post)) {
        data.append(completion)
    }
    
    func generateData() {
        sleep(3)
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 3*60*60)
        let formatteddate = formatter.string(from: time as Date)
        
        readFromFile()
        addNewPost { [weak self] in
            return Post(communityImage: UIImage(named: "1"), communityTitle: "Cказки на ночь", publicationDate: formatteddate, article: self?.textArray[0] ?? "", postImage: UIImage(named: self?.photos.randomElement() ?? "6"))
        }
        
        addNewPost { [weak self] in
            return Post(communityImage: UIImage(named: "2"), communityTitle: "Картина", publicationDate: formatteddate, article: "", postImage: UIImage(named: self?.photos.randomElement() ?? "6"))
        }
        
        addNewPost { [weak self] in
            return Post(communityImage: UIImage(named: "3"), communityTitle: "Cказки на ночь", publicationDate: formatteddate, article: self?.textArray[1] ?? "", postImage: UIImage(named: ""))
        }
        
        addNewPost { [weak self] in
            return Post(communityImage: UIImage(named: "4"), communityTitle: "Cказки на утро", publicationDate: formatteddate, article: self?.textArray[2] ?? "", postImage: UIImage(named: self?.photos.randomElement() ?? "6"))
        }
        
        addNewPost { [weak self] in
            return Post(communityImage: UIImage(named: "5"), communityTitle: "Cказки", publicationDate: formatteddate, article: self?.textArray[3] ?? "", postImage: UIImage(named: ""))
        }
        
        addNewPost { [weak self] in
            return Post(communityImage: UIImage(named: "1"), communityTitle: "Каркарыч", publicationDate: formatteddate, article: "", postImage: UIImage(named: self?.photos.randomElement() ?? "6"))
        }
    }
    
    func readFromFile() {
        if let path = Bundle.main.path(forResource: "text", ofType: "txt") {
            if let text = try? String(contentsOfFile: path) {
                textArray = text.components(separatedBy: "\n\n")
            }
        }
    }
}
