//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 08.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var userPostsTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var editButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        editButton.layer.backgroundColor = UIColor.systemGray6.cgColor
        logoutButton.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        userPostsTableView.delegate = self
        userPostsTableView.dataSource = self
        avatarImageView.image = UIImage(named: UserModel.currentUser.avatarImage)
        usernameLabel.text = UserModel.currentUser.username
        statusLabel.text = UserModel.currentUser.status
    }
    


}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserModel.users[0].posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userPostsTableView.dequeueReusableCell(withIdentifier: "ProfilePostsTableViewCell") as? ProfilePostsTableViewCell else { return UITableViewCell() }
        cell.configure(avatarImage: UserModel.users[0].posts[indexPath.row].avatarImagePost, name: UserModel.users[0].posts[indexPath.row].nameOfPost, date: UserModel.users[0].posts[indexPath.row].postInfo, postImage: UserModel.users[0].posts[indexPath.row].structPostImage, postText: UserModel.users[0].posts[indexPath.row].postText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userPostsTableView.deselectRow(at: indexPath, animated: true)
        guard let postViewController = storyboard?.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController else { return }
        postViewController.loadViewIfNeeded()
        postViewController.configure(avatarImage: UserModel.users[0].posts[indexPath.row].avatarImagePost, name: UserModel.users[0].posts[indexPath.row].nameOfPost, postInfo: UserModel.users[0].posts[indexPath.row].postInfo, postImage: UserModel.users[0].posts[indexPath.row].structPostImage, postText: UserModel.users[0].posts[indexPath.row].postText)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    
}
