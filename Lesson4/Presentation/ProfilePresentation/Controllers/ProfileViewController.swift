//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Danil Gerasimov on 08.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var userPostsTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    //MARK: - View Controller's vars
    var userPosts: [Post] = [Post]()
    //MARK: - View Controller's methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editButton.layer.backgroundColor = UIColor.systemGray6.cgColor
        logoutButton.layer.backgroundColor = UIColor.systemGray6.cgColor
        
        userPostsTableView.delegate = self
        userPostsTableView.dataSource = self
        guard let currentUser = UserDatasource.currentUser else { return }
        avatarImageView.image = UIImage(named: currentUser.avatarImage)
        usernameLabel.text = currentUser.username
        statusLabel.text = currentUser.status
        
        let dataManager: DataManager = DataManager()
        dataManager.getCurrentUserPosts { userPosts in
            self.userPosts = userPosts
        }
    }
    //MARK: - IBActions
    @IBAction func editAction(_ sender: Any) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "EditProfileInfoViewController") as? EditProfileInfoViewController else { return }
        controller.delegate = self
        present(controller, animated: true)
    }
    @IBAction func logOutAction(_ sender: Any) {
        UserDatasource.currentUser = nil
        guard let loginViewController = storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else { return }
        navigationController?.viewControllers = [loginViewController]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsFromProfileSegue",
           let viewController = segue.destination as? PostViewController,
           let post = sender as? Post {
            viewController.post = post
        }
    }
    
    
}
//MARK: - UITableViewDelegate, UITableViewDataSource extension
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let currentUser = UserDatasource.currentUser else { return 0 }
        return currentUser.selfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = userPostsTableView.dequeueReusableCell(withIdentifier: "ProfilePostsTableViewCell") as? ProfilePostsTableViewCell else { return UITableViewCell() }
        cell.userPostConfigure(post: userPosts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userPostsTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        performSegue(withIdentifier: "detailsFromProfileSegue", sender: userPosts[indexPath.row])
    }
    
    
}

extension ProfileViewController: EditProfileViewControllerDelegate {
    func updateStatus() {
        guard let currentUser = UserDatasource.currentUser else { return }
        statusLabel.text = currentUser.status
    }
}
