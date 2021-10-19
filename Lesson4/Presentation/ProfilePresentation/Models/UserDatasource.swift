//
//  UserModel.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 05.10.2021.
//

import Foundation

class UserDatasource {
    //MARK: - User array datasource
    // All posts array
    static var posts: [Post] = [
        Post(name: "SomeOne",
             date: "сегодня",
             avatarImage: "someone",
             text: "Новый формат домашек, который будет включать себя работу 3-х занятий. Почему так? Лично каждому могу объяснить если есть вопросы по этому поводу. Поверхностный просмотр домашки то есть review на качество кода и чистоту буду стараться проводить один раз в неделю и оставлять комментарии. Полный просмотр домашки будет по итогу трех занятий.",
             image: "image1"),
        Post(name: "SomeOne",
             date: "вчера",
             avatarImage: "someone",
             text: "Регулярные выражения представляют собой похожий, но гораздо более сильный инструмент для поиска строк, проверки их на соответствие какому-либо шаблону и другой подобной работы. Англоязычное название этого инструмента — Regular Expressions или просто RegExp. Строго говоря, регулярные выражения — специальный язык для описания шаблонов строк.Регулярные выражения представляют собой похожий, но гораздо более сильный инструмент для поиска строк, проверки их на соответствие какому-либо шаблону и другой подобной работы. Англоязычное название этого инструмента — Regular Expressions или просто RegExp. Строго говоря, регулярные выражения — специальный язык для описания шаблонов строк.Регулярные выражения представляют собой похожий, но гораздо более сильный инструмент для поиска строк, проверки их на соответствие какому-либо шаблону и другой подобной работы. Англоязычное название этого инструмента — Regular Expressions или просто RegExp. Строго говоря, регулярные выражения — специальный язык для описания шаблонов строк.Регулярные выражения представляют собой похожий, но гораздо более сильный инструмент для поиска строк, проверки их на соответствие какому-либо шаблону и другой подобной работы. Англоязычное название этого инструмента — Regular Expressions или просто RegExp. Строго говоря, регулярные выражения — специальный язык для описания шаблонов строк.",
             image: ""),
        Post(name: "Kolyan",
             date: "23 марта",
             avatarImage: "kolyan",
             text: "If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. You write a trailing closure after the function call’s parentheses, even though the trailing closure is still an argument to the function. When you use the trailing closure syntax, you don’t write the argument label for the first closure as part of the function call. A function call can include multiple trailing closures; however, the first few examples below use a single trailing closure.",
             image: ""),
        Post(name: "Kolyan",
             date: "cегодня",
             avatarImage: "kolyan",
             text: "По мнению заведующего инфекционным отделением больницы «Хуашань» в Шанхае Чжан Вэньхун массовая вакцинация приобрела другие цели. На сегодняшний день она не может остановить распространение коронавирусной инфекции, однако дает возможность снизить риск осложнений и летальность заболевания.В качестве примера эксперт привел Сингапур. Уровень иммунизации населения страны посредством прививок превысил 80%, однако число инфицированных при этом растет.",
             image: "kolyan2"),
        Post(name: "IvanIvanov",
             date: "cегодня",
             avatarImage: "ivanIvanov",
             text: "",
             image: "vklogo"),
        Post(name: "IvanIvanov",
             date: "вчера",
             avatarImage: "ivanIvanov",
             text: "Я создал вк. Я Павел Дуров. Или нет???",
             image: "vklogo")
    ]
    //All users array
    static var users: [User] = [
        User(username: "SomeOne",
             login: "someone@gmail.com",
             avatarImage: "someone",
             password: "karlik1",
             status: "Я кто-то и никто",
             selfPosts: [posts[0], posts[1]],
             personalPosts: [posts[2], posts[3]]),
        User(username: "Kolyan",
             login: "kolya@mail.ru",
             avatarImage: "kolyan",
             password: "jojak2",
             status: "Я коля, я умный",
             selfPosts: [posts[2], posts[3]],
             personalPosts: [posts[1], posts[4]]),
        User(username: "IvanIvanov",
             login: "ivanivanov@vk.com",
             avatarImage: "ivanIvanov",
             password: "ivanIvan1",
             status: "Я Иван Иванов. Программист",
             selfPosts: [posts[4], posts[5]],
             personalPosts: [posts[1], posts[2], posts[3]])
    ]
    //MARK: - Authorized user
    static var currentUser: User? = users[0]
    
}
