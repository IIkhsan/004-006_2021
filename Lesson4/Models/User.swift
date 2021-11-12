
import Foundation
import UIKit

class User {
    var name: String
    var surname: String
    var status: String
    var password: String
    var login: String
    var image: UIImage
    
    init(name: String, surname: String, status: String, password: String, login: String, image: UIImage) {
        self.login = login
        self.password = password
        self.status = status
        self.surname = surname
        self.name = name
        self.image = image
    }
}
