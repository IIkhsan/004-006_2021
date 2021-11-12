
import Foundation

class User {
    var name: String
    var surname: String
    var status: String
    var password: String
    var login: String
    
    init(name: String, surname: String, status: String, password: String, login: String) {
        self.login = login
        self.password = password
        self.status = status
        self.surname = surname
        self.name = name
    }
}
