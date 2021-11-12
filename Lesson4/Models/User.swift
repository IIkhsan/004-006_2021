
import Foundation
import UIKit

class User {
    //MARK: - Properties
    var name: String
    var surname: String
    var status: String
    var password: String
    var login: String
    var image: UIImage
    
    //MARK: - Initializer
    init(name: String, surname: String, status: String, password: String, login: String, image: UIImage) {
        self.login = login
        self.password = password
        self.status = status
        self.surname = surname
        self.name = name
        self.image = image
    }
}
