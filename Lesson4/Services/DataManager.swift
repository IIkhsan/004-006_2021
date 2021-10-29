//
//  DataManager.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 17.10.2021.
//

import Foundation
import UIKit

class DataManager {
    
    func getUsers(completion: @escaping(([User]) -> Void)) {
        sleep(1)
        var users: [User] = []
        
        users.append(User(email: "dune@google.com", password: "qwert1", username: "DUNE", accountName: "@dunemovie", status: "waiting for the movie", accountImage: #imageLiteral(resourceName: "duneAccountImage"), profileHeader: #imageLiteral(resourceName: "tumblr_4d00676f0bc97f54025d7e6687ac396d_e56447ec_1280")))
        
        users.append(User(email: "netflix@mail.ru", password: "netflix12", username: "Netflix", accountName: "@netflix", status: "see netflix", accountImage: #imageLiteral(resourceName: "netflixAccountImage"), profileHeader:#imageLiteral(resourceName: "09f739cb30ca8a17f1a655cadd0f76a4")))
        
        users.append(User(email: "cats@google.com", password: "catscool1", username: "Cats", accountName: "@cats", status: "Cats are cool", accountImage: #imageLiteral(resourceName: "catsAccountImage"), profileHeader: #imageLiteral(resourceName: "fc97c543dea3f9ef1ce04fee7fcb0082")))
        
        completion(users)
    }
    
    func getPosts(completion: @escaping(([Post]) -> Void)) {
        sleep(3)
        
        var posts: [Post] = []
        
        posts.append(Post(accountImage: #imageLiteral(resourceName: "duneAccountImage"), accountName: "@dunemovie" , username: "DUNE",postText: "A mythic and emotionally charged hero's journey,'Dune' tells the story of Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.", postDate: "12 sep 2021", postImage: #imageLiteral(resourceName: "dunePostImage")))
        
        posts.append(Post(accountImage: #imageLiteral(resourceName: "netflixAccountImage"), accountName: "@dunemovie", username: "Netflix",postText: "A new look at ‘STRANGER THINGS’ Season 4.", postDate: "4 oct 2021", postImage: nil))
        
        posts.append(Post(accountImage: #imageLiteral(resourceName: "catsAccountImage"), accountName: "@cats", username: "Cats",postText: nil, postDate: "21 sep 2020", postImage: #imageLiteral(resourceName: "catPostImage")))
        
        completion(posts)
    }
}
