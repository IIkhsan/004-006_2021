//
//  DataManager.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 19.10.2021.
//

import UIKit

class DataManager {
    
    func getPosts(completion: @escaping((_ posts: [Post]) -> Void)) {
        sleep(3)
        var posts: [Post] = []
        let post1 = Post(author: "Марина Сергеева", time: "вчера в 21:30", description: "Not bad, but take it to the next level by adding expanding cells to reveal more info about each work. Your client is going to love this!", image: nil)
        let post2 = Post(author: "Михаил Прокофьев", time: "сегодня в 5:30", description: "Предисловие: Наконец появилась возможность добраться до интернета, сейчас мы находимся в Панамском канале и здесь есть wifi. Я на судне уже больше месяца и пока я здесь, я писал все интересное что здесь происходит и вот наконец есть возможность этим поделиться. Фотографий пока не будет, их я выложу или позже, или уже когда вернусь домой. Итак, понеслась:", image: UIImage(named: "i2"))
        let post3 = Post(author: "Евгений Базаров", time: "вчера в 21:30", description: "Not bad, but take it to the next level by adding expanding cells to reveal more info about each work. Your client is going to love this!", image: UIImage(named: "i1"))
        let post4 = Post(author: "Марина Сергеева", time: "вчера в 21:30", description: "Not bad, but take it to the next level by adding expanding cells to reveal more info about each work. Your client is going to love this!", image: UIImage(named: "i2"))
        let post5 = Post(author: "Евгений Бзаров", time: "вчера в 21:30", description: "Not bad, but take it to the next level by adding expanding cells to reveal more info about each work. Your client is going to love this!", image: UIImage(named: "i1"))
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)
        
        let user1 = User(name: "Марина Сергеева", profileImage:UIImage(named: "u1"), city: "Москва", phoneNumber: "+7 912 566 2121", sex: "Женский", email: "marinas@mail.ru", password: "marina12", posts:[post1,post2])
        let user2 = User(name: "Михаил Прокофьев", profileImage:UIImage(named: "u2"), city: "Лондон", phoneNumber: "+7 987 523 3754", sex: "Мужской", email: "mishaprof@yandex.ru", password: "misha", posts: [post3])
        let user3 = User(name: "Евгений Базаров", profileImage:UIImage(named: "u2"), city: "Лондон", phoneNumber: "+7 987 523 3754", sex: "Мужской", email: "mishaprof@yandex.ru", password: "misha", posts: [post3,post5])
        
        completion(posts)

    }
}
