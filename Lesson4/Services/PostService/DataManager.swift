//
//  DataManager.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import Foundation
import UIKit

final class DataManager {
    //MARK: - Properties
    private let photos = ["1", "2", "3", "4", "5"]
    private let text = ["Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.Lorem Ipsum - это текст-рыба, часто используемый в печати и вэб-дизайне. Lorem Ipsum является стандартной рыбой для текстов на латинице с начала XVI века. В то время некий безымянный печатник создал большую коллекцию размеров и форм шрифтов, используя Lorem Ipsum для распечатки образцов. Lorem Ipsum не только успешно пережил без заметных изменений пять веков, но и перешагнул в электронный дизайн. Его популяризации в новое время послужили публикация листов Letraset с образцами Lorem Ipsum в 60-х годах и, в более недавнее время, программы электронной вёрстки типа Aldus PageMaker, в шаблонах которых используется Lorem Ipsum.", "Gg", "ios это система, которая позволяет вам чувствовать себя более умным с течением времени. У меня, к примеру, ios 10.2! Я уже 2 раз обновился и чувствую себя умнее! Даже моя собака говорит, что я умнее! Мой брат, как-то раз, решил поиграть в эту игру. Это было очень весело, так как он играл весь вечер и так и не прошел до конца!", "Математика не самая сложная наука, если вы знаете, как ее правильно применять."]
    private let nicks = ["sixz.r", "asda.sd", "el.primo", "welcome"]
    private var counterOfType = 0
    private let phones = ["+79148561256", "+76145567256", "+73198461296"]
    private let emails = ["test@mail.ru", "test@ya.ru", "test@gmail.com"]
    
    //MARK: - Generating methods
    func getPosts(completion : @escaping (_ data: [Post]) -> Void) {
        let posts = generatePosts()
        sleep(3)
        completion(posts)
    }
    
    func generateUsers(completion : @escaping (_ data: [User]) -> Void) {
        var users: [User] = []
        var user = User(name: "Роман Сницарюк", avatar: #imageLiteral(resourceName: "1"))
        user.status = nicks[0]
        user.city = "Kazan"
        user.phone = phones[0]
        user.email = emails[0]
        user.password = "Admin1"
        users.append(user)
        user = User(name: "Роман Сницарюк", avatar: #imageLiteral(resourceName: "2"))
        user.status = nicks[1]
        user.city = "Kazan"
        user.phone = phones[1]
        user.email = emails[1]
        user.password = "Admin1"
        users.append(user)
        user = User(name: "Роман Сницарюк", avatar: #imageLiteral(resourceName: "3"))
        user.status = nicks[2]
        user.city = "Kazan"
        user.phone = phones[2]
        user.email = emails[2]
        user.password = "Admin1"
        users.append(user)
        sleep(3)
        completion(users)
    }
    
    func generateUsersWithoutTime() -> [User] {
        var users: [User] = []
        var user = User(name: "Роман Сницарюк", avatar: #imageLiteral(resourceName: "1"))
        user.status = nicks[0]
        user.city = "Kazan"
        user.phone = phones[0]
        user.email = emails[0]
        user.password = "Admin1"
        users.append(user)
        user = User(name: "Роман Сницарюк", avatar: #imageLiteral(resourceName: "2"))
        user.status = nicks[1]
        user.city = "Kazan"
        user.phone = phones[1]
        user.email = emails[1]
        user.password = "Admin1"
        users.append(user)
        user = User(name: "Роман Сницарюк", avatar: #imageLiteral(resourceName: "3"))
        user.status = nicks[2]
        user.city = "Kazan"
        user.phone = phones[2]
        user.email = emails[2]
        user.password = "Admin1"
        users.append(user)
        return users
    }
    
    // MARK: - Private
    private func generatePosts() -> [Post] {
        var posts = [Post]()
        for _ in 1...3 {
            if let post = generatePost() {
                posts.append(post)
            }
        }
        return posts
    }
    
    private func generatePost() -> Post? {
        guard let author = generateAuthor() else { return nil }
        guard let photo = photos.compactMap({ UIImage(named: $0) }).randomElement() else { return nil }
        guard let text = text.randomElement() else { return nil }
        let post: Post
        switch counterOfType {
        case 0:
            post = Post(author: author, image: nil, text: text)
        case 1:
            post = Post(author: author, image: photo, text: nil)
        case 2:
            post = Post(author: author, image: photo, text: text)
        default:
            fatalError()
        }
        counterOfType += 1
        return post
    }
    
    private func generateAuthor() -> User? {
        guard let nick = nicks.randomElement() else { return nil }
        guard let photo = photos.compactMap({ UIImage(named: $0) }).randomElement() else { return nil }
        return User(name: nick, avatar: photo)
    }
}
