//
//  TestUsers.swift
//  Lesson4
//
//  Created by Руслан on 11.10.2021.
//

import Foundation

class DataManager {

    static func createDefaultUsers(completion: @escaping (_ users: [User]) -> Void) {
        sleep(3)
        
        var users: [User] = []
        
        let post1 = Post(accountLogo: #imageLiteral(resourceName: "matt"), accountName: "mattdavella", date: "5 min ago", text: "Smiling on the outside but having a full-blown menty b on the inside 🙃", image: #imageLiteral(resourceName: "matt1"))
        let post2 = Post(accountLogo: #imageLiteral(resourceName: "matt"), accountName: "mattdavella", date: "1 day ago", text: nil, image: #imageLiteral(resourceName: "matt4"))
        let post3 = Post(accountLogo: #imageLiteral(resourceName: "ali"), accountName: "aliabdaal", date: "1 week ago", text: "Please help me come up with a title for my book. Swipe to see current options. If anyone suggests the winning title I’ll be forever in your debt", image: nil)
        users.append(User(
            email: "ruslan@mail.ru", password: "pass123", avatarImage: #imageLiteral(resourceName: "user1Avatar"),
            fullName: "Ruslan Gazizov", status: "",
            lastActivity: "online", friendsCount: "98 friends",
            city: "Kazan", education: "KFU ITIS",
            followersCount: "220 followers", images: [#imageLiteral(resourceName: "user1image4"), #imageLiteral(resourceName: "user1image1"), #imageLiteral(resourceName: "user1image3"), #imageLiteral(resourceName: "user1image2")],
            posts: [post1, post2, post3, post1, post2, post3, post1, post2, post3]
        ))
        
        let post4 = Post(accountLogo: #imageLiteral(resourceName: "ali"), accountName: "aliabdaal", date: "1 week ago", text: "Hosted our first dinner party for the parents #adulting", image: #imageLiteral(resourceName: "ali2"))
        let post5 = Post(accountLogo: #imageLiteral(resourceName: "ali"), accountName: "aliabdaal", date: "1 week ago", text: "If you can find enjoyment in the thing you’re doing you will automatically be more productive 📈\n\n#productivity #productive #fulfilment #lifeadvice #enjoyment", image: nil)
        users.append(User(
            email: "ali@mail.ru", password: "123qwe", avatarImage: #imageLiteral(resourceName: "ali"),
            fullName: "Ali Abdaal", status: "Youtuber",
            lastActivity: "Online", friendsCount: "80 fruends",
            city: "London", education: "Medical school",
            followersCount: "1M followers", images: [],
            posts: [post4, post5, post4, post5, post4, post5]
        ))
        
        let post6 = Post(accountLogo: #imageLiteral(resourceName: "matt"), accountName: "mattdavella", date: "3 days ago", text: "Okay so I finalllyyyy tried yoga. And it’s not at all what I expected it to be. You can watch the full video on YouTube 🧘‍♂️", image: nil)
        let post7 = Post(accountLogo: #imageLiteral(resourceName: "matt"), accountName: "mattdavella", date: "2 days ago", text: nil, image: #imageLiteral(resourceName: "matt2"))
        let post8 = Post(accountLogo: #imageLiteral(resourceName: "matt"), accountName: "mattdavella", date: "1 day ago", text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.", image: nil)
        users.append(User(
            email: "matt@mail.ru", password: "qwerty1", avatarImage: #imageLiteral(resourceName: "matt"),
            fullName: "Matt D'avella", status: "Film maker",
            lastActivity: "Online", friendsCount: "50 friends",
            city: "Los Angeles", education: "Film making college",
            followersCount: "1M followers", images: [],
            posts: [post6, post7, post8, post6, post7, post8]
        ))
        
        completion(users)
    }

}
