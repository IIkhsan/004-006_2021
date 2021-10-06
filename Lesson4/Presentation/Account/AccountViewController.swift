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
        configure()
        obtainPostsData()
        obtainUserData()
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
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.generateUsers { data in
                DispatchQueue.main.async {
                    strongSelf.user = data.first
                    strongSelf.configureProfile()
                }
            }
        }
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
