//
//  ProfileFeed.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class ProfileFeed: UIViewController {

    @IBOutlet weak var profileFeed: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileFeed.dataSource = self
        profileFeed.delegate = self
        
        User.addInitialUsers()
    }

}

extension ProfileFeed: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return User.loggedInUser.posts.count + 2
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
        
        let user = User.loggedInUser
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
        
        if User.loggedInUser.posts[indexPath.row - 2].image != nil {
            return 650
        }
        return 200
    }
}
