//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 05.10.2021.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.estimatedRowHeight = 60
    }
}
extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UserModel.users[0].posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = feedTableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(avatarImage: UserModel.users[0].posts[indexPath.row].avatarImagePost, name: UserModel.users[0].posts[indexPath.row].nameOfPost, date: UserModel.users[0].posts[indexPath.row].postInfo, postImage: UserModel.users[0].posts[indexPath.row].structPostImage, postText: UserModel.users[0].posts[indexPath.row].postText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedTableView.deselectRow(at: indexPath, animated: true)
        guard let postViewController = storyboard?.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController else { return }
        postViewController.loadViewIfNeeded()
        postViewController.configure(avatarImage: UserModel.users[0].posts[indexPath.row].avatarImagePost, name: UserModel.users[0].posts[indexPath.row].nameOfPost, postInfo: UserModel.users[0].posts[indexPath.row].postInfo, postImage: UserModel.users[0].posts[indexPath.row].structPostImage, postText: UserModel.users[0].posts[indexPath.row].postText)
        navigationController?.pushViewController(postViewController, animated: true)
    }
    
    
}
