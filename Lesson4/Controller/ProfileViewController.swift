//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 17.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Outlet Properties
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var lastActivityLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var friendsLabel: UILabel!
    
    @IBOutlet weak var editDetailsButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = user.login
        
        decorateButtons()
        configureData()
        
        tableView.registerCustomCell(PostTableViewCell.self)
        tableView.reloadData()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func decorateButtons() {
        avatarImage.layer.cornerRadius = avatarImage.layer.frame.height / 2
        editDetailsButton.layer.cornerRadius = editDetailsButton.layer.frame.height / 8
        logOutButton.layer.cornerRadius = logOutButton.layer.frame.height / 8
    }
    
    func configureData() {
        avatarImage.image = user.avatarImage
        usernameLabel.text = user.login
        statusLabel.text = user.status
        lastActivityLabel.text = user.lastActivity
        educationLabel.text = user.education
        followersLabel.text = "Followers: \(user.followersNumber)"
        friendsLabel.text = "Friends: \(user.friendNum)"
    }
    
    @IBAction func editStatusAction(_ sender: Any) {
        let profileEditorViewController = storyboard?.instantiateViewController(withIdentifier: "ProfileEditorViewController") as! ProfileEditorViewController
        profileEditorViewController.user = user
        navigationController?.pushViewController(profileEditorViewController, animated: true)
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Configure UITableViewDelegate
extension ProfileViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = user?.posts?[indexPath.row]
        let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.post = post
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

// MARK: - Configure UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier(), for: indexPath) as? PostTableViewCell else { return PostTableViewCell() }
        guard let post = user.posts?[indexPath.row] else {
            return cell
        }
        cell.configure(with: post)
        return cell
    }
}

