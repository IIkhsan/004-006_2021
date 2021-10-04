//
//  AccountViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class AccountViewController: UIViewController {
    //MARK: - UI
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userStatusTextLabel: UILabel!
    @IBOutlet weak var changeUserStatusButton: UIButton!
    @IBOutlet weak var userTownTextLabel: UILabel!
    @IBOutlet weak var userPhoneNumberTextLabel: UILabel!
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var addNewPostButton: UIButton!
    @IBOutlet weak var changeStatusButton: UIButton!
    
    //MARK: - Var
    private var posts: [Post] = []
    private let dataManager = DataManager()
    private var user: User?
    
    //MARK: - VC's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = dataManager.generatePosts()
        user = dataManager.generateUsers()?.first
        configure()
    }
    
    //MARK: - Table's method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           let post = posts[indexPath.row]
           performSegue(withIdentifier: Constants.detailedPostSeque.rawValue, sender: post)
    }
       
    //MARK: - Helpers
    private func configure() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.estimatedRowHeight = 400
        
        guard let user = user else { return }
        userAvatarImageView.image = user.avatar
        userNameTextLabel.text = user.name
        userStatusTextLabel.text = user.status
        userTownTextLabel.text = user.city
        userPhoneNumberTextLabel.text = user.phone
        
        configureViews()
    }
    
    private func configureViews() {
        moreInfoButton.layer.cornerRadius = moreInfoButton.frame.height / 2
        moreInfoButton.backgroundColor = .gray
        changeStatusButton.layer.cornerRadius = changeUserStatusButton.frame.height / 2
        changeStatusButton.backgroundColor = .gray
        addNewPostButton.layer.cornerRadius = addNewPostButton.frame.height / 2
        addNewPostButton.backgroundColor = .gray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailedPostSeque.rawValue,
               let viewController = segue.destination as? DetailedPostViewController,
                let post = sender as? Post {
                    viewController.post = post
        }
    }
}

// MARK: - Table view data source
extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.configure(posts[indexPath.row])
        return cell
    }
}

