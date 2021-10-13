//
//  AccountViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class AccountViewController: UIViewController, UserExistenceDelegate {
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
    var user: User?
    
    //MARK: - VC's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        obtainPostsData()
        obtainUserData()
    }
    
    //MARK: - Button's actions
    @IBAction func changeStatusButtonTapped(_ sender: Any) {
        guard let user = user else { return }
        performSegue(withIdentifier: Constants.editingAccountSeque.rawValue, sender: user)
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
        configureViews()
    }
    
    private func obtainPostsData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.getPosts { data in
                DispatchQueue.main.async {
                    strongSelf.posts = data
                    strongSelf.postsTableView.reloadData()
                }
            }
        }
    }
    
    private func obtainUserData() {
        let tabBar = tabBarController as! MainTabBarViewController
        user = tabBar.user
        configureProfile()
    }
    
    // Set up elements
    private func configureViews() {
        moreInfoButton.layer.cornerRadius = moreInfoButton.frame.height / 2
        moreInfoButton.backgroundColor = .gray
        changeStatusButton.layer.cornerRadius = changeUserStatusButton.frame.height / 2
        changeStatusButton.backgroundColor = .gray
        addNewPostButton.layer.cornerRadius = addNewPostButton.frame.height / 2
        addNewPostButton.backgroundColor = .gray
    }
    
    private func configureProfile() {
        guard let user = user else { return }
        userNameTextLabel.text = user.name
        userAvatarImageView.image = user.avatar
        userStatusTextLabel.text = user.status
        userTownTextLabel.text = user.city
        userPhoneNumberTextLabel.text = user.phone
    }
    
    // Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailedPostSeque.rawValue,
               let viewController = segue.destination as? DetailedPostViewController,
                let post = sender as? Post {
                    viewController.post = post
        }
        if segue.identifier == Constants.editingAccountSeque.rawValue, let viewController = segue.destination as? EditingAccountViewController, let user = sender as? User {
            viewController.user = user
            viewController.editingAccountDelegate = self
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

//MARK: - Edit account delegate
extension AccountViewController: EditingAccountDelegate {
    
    func editProfile(_ user: User) {
        self.user = user
        configureProfile()
    }
}
