import Foundation
import UIKit

class UserService {
    
    private var users: [User]
    
    init() {
        users = [.init(name: "Charlotte", surname: "Bronte", status: "Keep calm and have fun", password: "sTrInG", login: "login@gmail.com", image: UIImage.init(named: "User1") ?? UIImage()),
                 .init(name: "Oscar", surname: "Wilde", status: "Be yourself; everyone else is already taken.", password: "wilde1", login: "oscar@bk.ru", image: UIImage.init(named: "User2") ?? UIImage()),
                 .init(name: "Bernard", surname: "Shaw", status: "Иногда надо рассмешить людей, чтобы отвлечь их от намерения вас повесить.", password: "show11", login: "bernard@mail.ru", image: UIImage.init(named: "User3") ?? UIImage())
        ]
    }
    
    func getUser(login: String, password: String) -> User? {
        var users = users.filter { $0.login == login && $0.password == password }
        
        if !users.isEmpty { return users.removeFirst() }
        
        return nil
    }
}
