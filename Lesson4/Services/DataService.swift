//
//  DataContainer.swift
//  Lesson4
//
//  Created by Marat Giniyatov on 11.11.2021.
//

import UIKit

class  DataService {
    var currentPost: Post = Post(postImage: UIImage(named: "post1"), userImage: UIImage(named: "post1"), username: "", text: "")
    
    let userData = [User(username: "123", email: "123@mail.ru", password: "pop113", phoneNumber: "88005553535",city: "Kazan",avatar: #imageLiteral(resourceName: "profile4") , status: "Кайфуем!!!"),
                    User(username: "admin", email: "admin@mail.ru", password: "admin1", phoneNumber: "89991692418", city: "Kazan",avatar: #imageLiteral(resourceName: "profile3"), status: "хочу поесть..."),
                    User(username: "Maratik2002", email: "marrat02@mail.ru", password: "popjop1", phoneNumber: "81234567890", city: "Honolulu", avatar: #imageLiteral(resourceName: "profile2") , status: "привет!")]
    let postText = ["С приходом в Формулу 1 Гуаньюя Чжоу в календаре Формулы 1 может появиться второй китайский этап. Гран При Китая из-за пандемии коронавируса не проводился с 2019 года, его нет и в календаре на следующий сезон, но недавно было объявлено о подписании нового трёхлетнего контракта с 2023 года.",
                "Альбому Childish Gambino «Awaken, My Love!» исполнилось 5 лет. Это был переломный момент в карьере Дональда Гловера, когда он абсолютно неожиданно отошёл от рэпа и начал экспериментировать с психоделическом соулом и Пластинка подарила нам хит «Redbone», получивший пятикратную платину и выигравший Грэмми, а также прозвучавший в фильме ужасов «Прочь».",
        "Если бы стал миллионером, то нераздумывая купил бы небольшой дом с бассейном в Беверли Хиллс, это то самое место, где Лос Анджелес ровно такой, каким его себе представляешь: чистый, пальмы, идеальные газончики",
                    "Смеша́рики — российский мультипликационный сериал, ориентированный на широкую аудиторию. Создан в рамках образовательного проекта «Мир без насилия» и производится при поддержке Министерства культуры Российской Федерации.",
                    "Pepe the Frog, one of the most popular internet memes of all time. It's now considered a symbol of hate, according to the Anti-Defamation League. ",
                    "Вы, конечно, опять меня извините, но я вас ещё раз спрошу, что, некомпетентны? Вы действительно думаете, что этот уровень сервиса может быть удовлетворительным? Ваша коллега, простите, проводит какие-то манипуляции с предоставленными ей картами. Другой ваш коллега делает что-то похожее... – Пожалуйста, приглядитесь внимательнее... – Вы, конечно, меня извините, но по-моему для данных функций у вас есть дилер, чтобы делать это в открытую, на глазах посетителей. – Ваша просьба и некоторое возмущение, быть может, оправданы в данной ситуации. Теперь этим действительно будет заниматься дилер. Просто в силу определённых обстоятельств, полномочия были делегированы мне..."]
    let postImage = [UIImage(named: "post1"),UIImage(named: "post2"),UIImage(named: "post3"),UIImage(named: "post4"),UIImage(named: "post5"),UIImage(named: "post6"),]

        
    
    
    func getUsers(completion: @escaping(([User]) -> Void)) {
        completion(userData)
        
    }
    func makePostData(completion: @escaping(([Post]) -> Void)) {
        sleep(1)
        var posts: [Post] = []
        let textPostCount = 3
        let textImageCount = 6
        
        
        for _ in 0...2 {
            let image = postImage[Int.random(in: 0..<5)]
            let user = userData[Int.random(in: 0..<3)]
            
            let post = Post(postImage: image, userImage: user.avatar, username: user.username, text: nil )
            posts.append(post)
        }
        
        for _ in 1...textPostCount {
            let text = postText[Int.random(in: 0..<5)]
            let user = userData[Int.random(in: 0..<3)]
            
            let post = Post(postImage: nil, userImage: user.avatar, username: user.username, text: text )
            posts.append(post)
            
        }
        for _ in 1...textImageCount {
            let image = postImage[Int.random(in: 0..<5)]
            let text = postText[Int.random(in: 0..<3)]
            let user = userData[Int.random(in: 0..<3)]

            
            let post = Post(postImage: image, userImage: user.avatar, username: user.username, text: text )
            posts.append(post)
            
        }
       
       let data =  posts.shuffled()
        completion(data)
    }
}
