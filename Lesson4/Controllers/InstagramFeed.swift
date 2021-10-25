//
//  InstagramFeed.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class InstagramFeed: UIViewController {

    @IBOutlet weak var instagramFeed: UITableView!
    var allPosts: [Post] = []
    var usersInOrder: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instagramFeed.dataSource = self
        instagramFeed.delegate = self
        
        addRandomPosts()
        
    }
}

extension InstagramFeed: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = allPosts[indexPath.row]
        let user = usersInOrder[indexPath.row]
        
        let cell = instagramFeed.dequeueReusableCell(withIdentifier: "standardPost") as! PostTableViewCell
        cell.postText?.text = post.text
        cell.postImg?.image = post.image
        cell.postAccountName.text = user.name
        cell.postAccountImg.image = user.profileImg
        cell.postAccountStatus.text = user.status
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if allPosts[indexPath.row].image != nil {
            return 650
        }
        return 200
    }
    
    func addRandomPosts() {
        for _ in 0..<Int.random(in: 7...18) {
            let randomUser = User.all_users[Int.random(in: 0..<User.all_users.count)]
            let randomPost = randomUser.posts[Int.random(in: 0..<randomUser.posts.count)]
            allPosts.append(randomPost)
            usersInOrder.append(randomUser)
        }
    }
}
