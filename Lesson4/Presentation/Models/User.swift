import Foundation
import UIKit

struct User {
    
    
    var username: String?
    var email: String?
    var password: String?
    var phoneNumber: String?
    var city: String?
    var avatar: UIImage?
    var status: String?
  

    
        
    init(username: String, email: String, password: String, phoneNumber: String, city: String, avatar: UIImage, status: String) {
        self.username = username
        self.email = email
        self.password = password
        self.phoneNumber = phoneNumber
        self.city = city
        self.avatar = avatar
        self.status = status
    }
    
}
