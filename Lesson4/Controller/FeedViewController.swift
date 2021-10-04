//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 01.10.2021.
//

import UIKit

class FeedViewController: UITableViewController {
    
    var user: User!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image-3"), text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: nil))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image-3"), text: "Александр Усик победил Энтони Джошуа и стал чемпионом мира в супертяжёлом Бой, прошедший в Лондоне, продлился все 12 раундов. Все трое судей отдали Усику - 117:112, 116:112, 115:113. Таким образом, Усик завоевал титул мира по версиям Всемирной боксёрской ассоциации (WBA), Всемирной боксёрской  (WBO), Международной федерации (IBF) и боксёрской организации (IBO) в супертяжёлом весе.", image: #imageLiteral(resourceName: "Image-3")))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image-2"), text: nil, image: #imageLiteral(resourceName: "Image-2")))
        posts.append(Post(authorName: "Alex", authorAvatar: #imageLiteral(resourceName: "Image-3"), text: nil, image: #imageLiteral(resourceName: "Image-1")))
        
        tableView.registerCustomCell(PostTableViewCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier(), for: indexPath) as? PostTableViewCell else { return PostTableViewCell()}
        
        let post = posts[indexPath.row]

        cell.configure(with: post)
        return cell
    }
}

protocol CustomCell {
    
    static func cellIdentifier() -> String
    
    static func cellNib() -> UINib?
}

extension UITableView{
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifier())
    }
}
