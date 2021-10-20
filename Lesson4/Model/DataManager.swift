//
//  DataManager.swift
//  Lesson4
//
//  Created by andrewoch on 15.10.2021.
//

import UIKit

final class DataManager {
    
    //   MARK: - Properties
    
    var usernames:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String] ?? defaultUsersNames
    
    
    //MARK: - Private properties
    
    private let texts: [String] = ["Помните, с какой уверенностью вы все говорите об увеличении производства, росте выпуска продукции? У нас в стране есть свои «знаменитости» в области экономики. Их имена прочно вошли в историю отечественной промышленности: Павел Дмитриевич Хохряков, Петр Васильевич Мосягин, Владимир Павлович Тихонов, Анатолий Георгиевич Сергеев, Виктор Семенович Комаров.",
                                   "Привет! Рада всем, кто заглянул на мой канал! Сегодня я покажу вам, как приготовить суп с чечевицей и нутом. Это очень вкусный и сытный суп, который готовится без мяса, но получается очень сытным.", "Ага! То есть мы сейчас пойдём и что-нибудь по дороге сожжём? – Нет, не стоит. Там, в лесу, осталось много чего интересного. Мы сейчас сходим туда, заберём, что нужно, а потом пойдём домой. Нам нужно успеть до заката, иначе мы не успеем вернуться засветло."]
    private let images:[UIImage] = [#imageLiteral(resourceName: "camera-1868773_1280"), #imageLiteral(resourceName: "201321061558118131"), #imageLiteral(resourceName: "mult-ava-instagram-2") , #imageLiteral(resourceName: "c13e60c5db62cea5b1f394883c7a90c7"), #imageLiteral(resourceName: "ryan-lepage"),#imageLiteral(resourceName: "1202399791_preview_15034743_1798112143788452_7709561090543190016_n")]
    
    private let postsCount = 10
    
    private var posts: [Post] = []
    
    
    //   MARK: - Default users data
    
    static let defaultUsersNames = ["admin", "user2020", "helloWorld"]
    static let defaultUsersEmails = ["admin@admin.ru", "username12@yandex.ru", "helloworld@google.com"]
    static let defaultUsersPasswords = ["qwerty123", "solved500", "hello2world"]
    
    
    //MARK: - Get user data
    
    static func getCurrentUser()->User?{
        guard let userId:Int = UserDefaults.standard.object(forKey: "currentUserId") as? Int
        else {
            return nil
        }
        
        let usernames:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String] ?? defaultUsersNames
        let emails:[String] = UserDefaults.standard.array(forKey: "emails") as? [String] ?? defaultUsersEmails
        let passwords:[String] = UserDefaults.standard.array(forKey: "passwords") as? [String] ?? defaultUsersPasswords
        
        let user: User = User(username: usernames[userId], email: emails[userId], password: passwords[userId])
        
        return user
    }
    
    static func getCurrentUserId() -> Int{
        return UserDefaults.standard.object(forKey: "currentUserId") as? Int ?? -1
    }
    
    
    //MARK: - Set user data
    
    static func changeCurrentUserName(username: String){
        guard let userId:Int = UserDefaults.standard.object(forKey: "currentUserId") as? Int
        else {return}
        
        var usernames:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String] ?? defaultUsersNames
        usernames[userId] = username
        
        UserDefaults.standard.set(usernames, forKey: "usernames")
    }
    
    static func changeCurrentUserEmail(email: String){
        guard let userId:Int = UserDefaults.standard.object(forKey: "currentUserId") as? Int
        else {return}
        
        var emails:[String] = UserDefaults.standard.array(forKey: "emails") as? [String] ?? defaultUsersEmails
        emails[userId] = email
        
        UserDefaults.standard.set(emails, forKey: "emails")
    }
    
    static func changeCurrentUserPassword(password: String){
        guard let userId:Int = UserDefaults.standard.object(forKey: "currentUserId") as? Int
        else {return}
        
        var passwords:[String] = UserDefaults.standard.array(forKey: "passwords") as? [String] ?? defaultUsersPasswords
        passwords[userId] = password
        
        UserDefaults.standard.set(passwords, forKey: "passwords")
    }
    
    
    //MARK: - Generating functions
    
    func getPosts(completion : @escaping (_ data: [Post]) -> Void) {
        posts = generatePosts()
        sleep(3)
        completion(posts)
    }
    
    func reloadUsernames(completion : @escaping (_ data: [Post]) -> Void) {
        guard let p = reloadCurrentUserName() as [Post]? else {completion(posts)}
        posts = p
        sleep(1)
        completion(posts)
    }
    
    private func reloadCurrentUserName() -> [Post]{
        guard let userId = UserDefaults.standard.object(forKey: "currentUserId") as? Int else {return []}
        let names:[String] = UserDefaults.standard.array(forKey: "usernames") as? [String] ?? DataManager.defaultUsersNames
        
        let newName = names[userId]
        for post in posts {
            if post.authorUsername == usernames[userId] {
                post.authorUsername = newName
            }
        }
        usernames[userId] = newName
        return posts
    }
    
    private func generatePosts() -> [Post] {
        var posts = [Post]()
        
        for _ in 0..<postsCount {
            let postType = Int.random(in: 0...2)
            if let post =  generatePost(postType: postType){
                posts.append(post)
            }
        }
        return posts
    }
    
    private func generatePost(postType: Int) -> Post? {
        
        guard let text = texts.randomElement() else { return nil}
        guard let image = images.randomElement() else { return nil}
        guard let username = usernames.randomElement() else { return nil}
        guard let userImage = images.randomElement() else { return nil}
        
        switch postType {
        case 0:
            return Post(text: text, image: nil, authorUsername: username, authorImage: userImage)
        case 1:
            return Post(text: nil, image: image, authorUsername: username, authorImage: userImage)
        default:
            return Post(text: text, image: image, authorUsername: username, authorImage: userImage)
        }
    }
}
