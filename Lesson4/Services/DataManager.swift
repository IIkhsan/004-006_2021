//
//  DataManager.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 18.10.2021.
//

import Foundation

class DataManager {

    func createDefaultUsers(completion: @escaping (_ users: [User]) -> Void) {
        sleep(1)
        
        var users: [User] = []
        
        let post1 = Post(authorName: "alex@mail.ru", authorAvatar: #imageLiteral(resourceName: "Image-3"), text: nil, image: #imageLiteral(resourceName: "Image"), date: "1 week ago")
        let post2 = Post(authorName: "alexey@mail.ru", authorAvatar: #imageLiteral(resourceName: "Image"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: nil, date: "2 days ago")
        let post3 = Post(authorName: "anton@mail.ru", authorAvatar: #imageLiteral(resourceName: "Image-1"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: #imageLiteral(resourceName: "Image-3"), date: "3 years ago")
        users.append(User.init(login: "alexandr@mail.ru", password: "alex00", avatarImage: #imageLiteral(resourceName: "anton"), status: "Studying", lastActivity: "Online", friendNum: 234, city: "Moscow", education: "MGU", followersNumber: 123, images: [#imageLiteral(resourceName: "Image-1")], posts: [post1, post2, post3]))
        
        let post4 = Post(authorName: "alex@mail.ru", authorAvatar: #imageLiteral(resourceName: "Image-4"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: nil, date: "1 week ago")
        let post5 = Post(authorName: "alexey@mail.ru", authorAvatar: #imageLiteral(resourceName: "Image-1"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: #imageLiteral(resourceName: "Image-3"), date: "2 days ago")
        let post6 = Post(authorName: "anton@mail.ru", authorAvatar: #imageLiteral(resourceName: "alexey"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: #imageLiteral(resourceName: "Image-3"), date: "3 years ago")
        users.append(User.init(login: "alexey@mail.ru", password: "alexey00", avatarImage: #imageLiteral(resourceName: "alexandr"), status: "Working", lastActivity: "Online", friendNum: 543, city: "Kazan", education: "KFU", followersNumber: 345, images: [#imageLiteral(resourceName: "Image-1")], posts: [post4, post5, post6]))
        
        let post7 = Post(authorName: "alex@mail.ru", authorAvatar: #imageLiteral(resourceName: "Image"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: #imageLiteral(resourceName: "Image"), date: "2 days ago")
        let post8 = Post(authorName: "alexey@mail.ru", authorAvatar: #imageLiteral(resourceName: "alexey"), text: nil, image: #imageLiteral(resourceName: "Image"), date: "1 week ago")
        let post9 = Post(authorName: "anton@mail.ru", authorAvatar: #imageLiteral(resourceName: "alexey"), text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: nil, date: "3 years ago")
        users.append(User.init(login: "anton@mail.ru", password: "anton00", avatarImage: #imageLiteral(resourceName: "Image-4"), status: "AUUUUUF", lastActivity: "Online", friendNum: 423, city: "Moscow", education: "MGTU", followersNumber: 456, images: [#imageLiteral(resourceName: "Image-1")], posts: [post7, post8, post9]))
        
        completion(users)
    }
}
