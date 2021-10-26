//
//  ProfileFeed.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class ProfileFeed: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var profileFeed: UITableView!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        profileFeed.dataSource = self
        profileFeed.delegate = self
    
        configureOfUsers()
        User.getUsersPosts(putPosts: loadPosts(_:), userID: User.loggedInUserId)
    }
    
    func loadPosts(_ posts: [Post]) {
        posts.forEach { post in
            User.all_users[User.loggedInUserId].posts.append(post)
        }
    }
    
    // MARK: - Private Methods
    private func configureOfUsers() {
        if User.all_users.count < 3{
            User.addInitialUsers()
        }
    }
}

// MARK: - ProfileFeed extensions
extension ProfileFeed: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.all_users[User.loggedInUserId].posts.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row > 1 else {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: "accountInformation") as! AccountInformationTableViewCell
            }
            else {
                return tableView.dequeueReusableCell(withIdentifier: "friendsList") as! FriendsListTableViewCell
            }
        }
        
        let user = User.all_users[User.loggedInUserId]
        let post = user.posts[indexPath.row - 2]
        let cell = tableView.dequeueReusableCell(withIdentifier: "standardProfilePost") as! PostTableViewCell
        cell.postText?.text = post.text
        cell.postImg?.image = post.image
        cell.postAccountName.text = user.name
        cell.postAccountImg.image = user.profileImg
        cell.postAccountStatus.text = user.status
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row > 1 else {
            if indexPath.row == 0 {
                return 250
            }
            else{
                return 150
            }
        }
        
        if User.all_users[User.loggedInUserId].posts[indexPath.row - 2].image != nil {
            return 650
        }
        return 200
    }
}
