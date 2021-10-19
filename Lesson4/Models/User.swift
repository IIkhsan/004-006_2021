import Foundation
import UIKit

class User {
    
    static var loginDetails: [String: String] = ["admin": "admin"]
    static var all_users: [User] = []
    
    static func сheckPassword(login: String, password: String) -> Bool {
        return User.loginDetails[login] == password
    }
    
    static func addInitialUsers() {
        User.all_users.append(User(name: "tattebakery", profileImg: UIImage.init(named: "tattebakery_photo_account") ?? UIImage(),status: "Gathering around Breakfas"))
        User.all_users.append(User(name: "brianmcw", profileImg: UIImage.init(named: "brianmcw_photo_account") ?? UIImage(), status: "Boston photographer"))
        User.all_users.append(User(name: "stephjianni", profileImg: UIImage.init(named: "stephjianni_photo_account") ?? UIImage(), status: "Life enthusiast."))
        addContentForInitialUsers()
    }
    
    private static func addContentForInitialUsers() {
        //add the content of the first user
        let firstUser = User.all_users[0]
        firstUser.posts.append(Post(image: UIImage.init(named: "tattebakery_photo_1"), text: "Back at it! With a glorious slice of Bourbon infused pumpkin pie with pecans and streusel on top! Our incredible pastry team roast fresh pumpkins in house creating this delicious Fall treat. 🙌🏻🍁🍂🥧🧡"))
        firstUser.posts.append(Post(image: UIImage.init(named: "tattebakery_photo_2"), text: "Tatte Clarendon here we go!🥳☕️🥐🍳💛Doors open tomorrow, Wednesday at 8am! Cannot wait to finally meet all of you!See you tomorrow! 🥳☕️☕️🥐🥐🥐🍳🍳🍳💛💛💛💛"))
        firstUser.posts.append(Post(image: UIImage.init(named: "tattebakery_photo_3"), text: nil))
        firstUser.posts.append(Post(image: UIImage.init(named: "tattebakery_photo_4"), text: "Chocolate Krembos are back! 🥳"))
        firstUser.posts.append(Post(image: UIImage.init(named: "tattebakery_photo_5"), text: "This one is so good! Summer Shakshukah! ☀️🍳🍅🌽🌿 "))
        firstUser.posts.append(Post(image: nil, text: "All the Fall - Winter treats ☕️🥧🍁 Winter spice latte and that delicious Pumpkin Pie, Maple-Pecan Pie all coming back this coming Wednesday 10/13 ☕️🥧🍂🍁along with our Fall-Winter menu and new delicious savory and bakery menu items 🍂🍁🍽. Beautiful pic"))
        firstUser.posts.append(Post(image: nil, text: "Fall day and thank you all for the massive love 🍁🍂🧡🥐🍳☕️"))
        firstUser.posts.append(Post(image: nil, text: "I’m going to be as present as I can be to truly feel and enjoy every moment I have on this earth. ❤️"))
        
        //add the content of the second user
        let secondUser = User.all_users[1]
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_1"), text: "Go for the gold 🍂💛Honey locust trees around golden hour earlier this week on Dartmouth Street.Have a great weekend!"))
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_2"), text: "In the mood on Marlborough 🎃🌾🍂"))
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_3"), text: "Worshipping at the church of autumn 🍁When we grow impatient with the slow pace of autumn in the city, we sometimes head north."))
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_4"), text: nil))
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_5"), text: nil))
        secondUser.posts.append(Post(image: nil, text: "The tones they are a changin' 🤎🎶Rounding the corner to September brings light that, as they say, hits different"))
        secondUser.posts.append(Post(image: nil, text: "May the top-down weather continue a while longer 🌞"))
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_6"), text: nil))
        secondUser.posts.append(Post(image: UIImage.init(named: "brianmcw_photo_7"), text: "I think I'll go to East Boston ⛵"))
        
        //add the content of the third user
        let thirdUser = User.all_users[2]
        thirdUser.posts.append(Post(image: UIImage.init(named: "stephjianni_photo_1"), text: "✨ I’ve been fairly absent on social media for the last 6 months to recoup and refocus my energy to live in the moment with the people I love most instead of constantly being consumed by this travel and social media lifestyle. While I am eternally grateful for the opportunities to travel the world, work with people and do things that I otherwise wouldn’t have been able to do the last 5 years, I know that I will be moving forward towards a life that’s more balanced, a little more settled and filled with adventure and joy. I will still continue to travel and to create and I will continue to share my passions with you all, but instead of constantly being glued to a screen, I’m going to be as present as I can be to truly feel and enjoy every moment I have on this earth. ❤️"))
        thirdUser.posts.append(Post(image: UIImage.init(named: "stephjianni_photo_2"), text: "1 balloon, 2 balloon, 3 balloon..."))
        thirdUser.posts.append(Post(image: UIImage.init(named: "stephjianni_photo_3"), text: "What dreams are made of ✨"))
        thirdUser.posts.append(Post(image: UIImage.init(named: "stephjianni_photo_4"), text: "The perfect Sunday? I think so ✨"))
        thirdUser.posts.append(Post(image: UIImage.init(named: "stephjianni_photo_5"), text: nil))
        thirdUser.posts.append(Post(image: UIImage.init(named: "stephjianni_photo_6"), text: nil))
        thirdUser.posts.append(Post(image: nil, text: "Where’s Waldo but Waldo wearing a more modern shade of mustard?"))
        thirdUser.posts.append(Post(image: nil, text: "❤️ I’m so lucky to have found you in this crazy world. There will never be enough words to tell you how much I love you. You are unlike anyone else I’ve ever known and I’m so grateful to get to spend this life with you. I can’t wait to see what this next year has in store and I know that all your amazing hard work will continue to pay off in ways we couldn’t even imagine! Thank you for continually making me laugh, for being my forever dance partner and for always being there no matter what life throws our way. Life isn’t always rainbows and sunshine, but with you, it’s pretty darn close."))

    }
    
    var name: String
    var profileImg: UIImage
    var status: String
    var posts: [Post] = []
    
    init(name: String, profileImg: UIImage, status: String) {
        self.name = name
        self.profileImg = profileImg
        self.status = status
    }
    
}
