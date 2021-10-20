import Foundation
import UIKit

class Database {
    
    // MARK: - Init
    
    init(){
        currentUser = users[0]
        configure()
    }
    
    // MARK: - Properties
    
    var currentUser: User
    
    var posts: [Post] = [.init(author: "Штаб", timestamp: "10 ч. назад", profilePicture: UIImage(named: "smart") ?? UIImage(), content: "Мы как и все видим этот обман, но призываем вас посмотреть немного шире. Если мы сейчас опустим руки, ничего не изменится. Если мы не дадим отпор, они еще больше будут наглеть, грабить, давить и унижать нас", contentPicture: nil),
                            .init(author: "Netflix", timestamp: "17 м. назад", profilePicture: UIImage(named: "netflix") ?? UIImage(), content: "Эстетика Тимоти Шаламе 😍", contentPicture: UIImage(named: "timothy") ?? UIImage()),
                            .init(author: "/vigvamcev", timestamp: "3 ч. назад", profilePicture: UIImage(named: "vigvamcev") ?? UIImage(), content: nil, contentPicture: UIImage(named: "komanda") ?? UIImage()),
                            .init(author: "Инде • Казань", timestamp: "7 ч. назад", profilePicture: UIImage(named: "inde") ?? UIImage(), content: "В Иннополисе беспилотные такси начнут работать без инженера-испытателя, который раньше располагался на переднем пассажирском сиденье, сообщили «Инде» в мэрии Иннополиса. Новый формат внедрят этой осенью, после вступления в силу соответствующего закона.", contentPicture: nil),
                            .init(author: "TJ", timestamp: "4 ч. назад", profilePicture: UIImage(named: "TJ") ?? UIImage(), content: "Здоровенные черви, спайс и «Страна Лимония»: как рунет встретил «Дюну» — один из самых ожидаемых фильмов года. 16 сентября в России и нескольких странах Европы вышла новая экранизация научно-фантастического романа Фрэнка Герберта «Дюна». По его сюжету человечество разделилось на могущественные кланы, каждый из которых живёт на своей планете. В центре внимания оказывается пустынный Арракис, где добывают пряность (в других переводах встречаются термины «спайс», «специи») — самое ценное вещество во вселенной. В России новая версия «Дюны» установила рекорд посещаемости с начала пандемии, а российские зрители принесли больше всего кассовых сборов.", contentPicture: nil),
                            .init(author: "OverFire", timestamp: "5 м. назад", profilePicture: UIImage(named: "overfire") ?? UIImage(), content: "Умилительный факт: на стене кошачьего кафе в Канедзаке висят фото котов разработчиков Blizzard", contentPicture: UIImage(named: "overwatch") ?? UIImage()),
                            .init(author: "INSTASAMKA x MONEYKEN | 12 НОЯБРЯ", timestamp: "4 ч. назад", profilePicture: UIImage(named: "instasamka") ?? UIImage(), content: "😱Казань, вас оказалось больше, чем ожидалось! В связи с этим мы вынуждены перенести концерт на 12 ноября в BIG TWIN ARENA", contentPicture: UIImage(named: "instasamka1") ?? UIImage()),
                            .init(author: "Рустам Минниханов", timestamp: "2 м. назад", profilePicture: UIImage(named: "rustam") ?? UIImage(), content: "Хаерле ирте!", contentPicture: UIImage(named: "utro") ?? UIImage()),
                            .init(author: "CТС Love", timestamp: "6 ч. назад", profilePicture: UIImage(named: "love") ?? UIImage(), content: "«Сердца за любовь» сегодня в 1:20 на СТС Love", contentPicture: UIImage(named: "heart") ?? UIImage()),
                            .init(author: "Netflix", timestamp: "2 ч. назад", profilePicture: UIImage(named: "netflix") ?? UIImage(), content: "Отис и Руби — любимая пара третьего сезона среди поклонников сериала «Сексуальное просвещение».", contentPicture: UIImage(named: "sex") ?? UIImage()),
                         .init(author: "Медуза", timestamp: "1 ч. назад", profilePicture: #imageLiteral(resourceName: "meduza"), content: "ДАННОЕ СООБЩЕНИЕ (МАТЕРИАЛ) СОЗДАНО И (ИЛИ) РАСПРОСТРАНЕНО ИНОСТРАННЫМ СРЕДСТВОМ МАССОВОЙ ИНФОРМАЦИИ, ВЫПОЛНЯЮЩИМ ФУНКЦИИ ИНОСТРАННОГО АГЕНТА, И (ИЛИ) РОССИЙСКИМ ЮРИДИЧЕСКИМ ЛИЦОМ, ВЫПОЛНЯЮЩИМ ФУНКЦИИ ИНОСТРАННОГО АГЕНТА.", contentPicture: nil)]
    
    var users: [User] = [.init(name: "unterlantas", email: "unterlantas@mail.ru", password: "Unterlantas1", profileImage: UIImage(named: "unterlantasava") ?? UIImage(), posts: []),
                         .init(name: "den4ik540", email: "den4ik540@mail.ru", password: "Den4ik5401", profileImage: UIImage(named: "den4ik540ava") ?? UIImage(), posts: []),
                         .init(name: "ilyas_kzn", email: "ilyas_kzn@mail.ru", password: "Ilyas_kzn1", profileImage: UIImage(named: "ilyas_kznava") ?? UIImage(), posts: [])]
    
    func configure() {
        for i in 0...3 {
            users[0].posts.append(posts[i])
        }
        
        for i in 4...7 {
            users[1].posts.append(posts[i])
        }
        
        for i in 7...10 {
            users[2].posts.append(posts[i])
        }
    }
    
}

    var data = Database()



    
