import Foundation

class UserService {
    
    private var users: [User]
    
    init() {
        users = [.init(name: "Jane", surname: "Olifer", status: "Keep calm and have fun", password: "sTrInG", login: "log.in@gmail.com"),
                 .init(name: "Oscar", surname: "Wilde", status: "Be yourself; everyone else is already taken.", password: "wilde1", login: "oscar@bk.ru"),
                 .init(name: "Bernard", surname: "Shaw", status: "Иногда надо рассмешить людей, чтобы отвлечь их от намерения вас повесить.", password: "show11", login: "bernard@mail.ru")
        ]
    }
    
    func getUser(login: String, password: String) -> User? {
        var users = users.filter { $0.login == login && $0.password == password }
        
        if !users.isEmpty { return users.removeFirst() }
        
        return nil
    }
}
