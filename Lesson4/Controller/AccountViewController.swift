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
    @IBOutlet weak var changeStatusButton: UIButton!
    @IBOutlet weak var userTownTextLabel: UILabel!
    @IBOutlet weak var userPhoneNumberTextLabel: UILabel!
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var counterOfPostsTextLabel: UILabel!
    
    //MARK: - Var
    private var posts: [Post] = []
    private let dataManager = DataManager()
    private var heightOfTableView: CGFloat = 0
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
        counterOfPostsTextLabel.text = posts.count.description
        
        guard let user = user else { return }
        userAvatarImageView.image = user.avatar
        userNameTextLabel.text = user.name
        userStatusTextLabel.text = user.status
        userTownTextLabel.text = user.city
        userPhoneNumberTextLabel.text = user.phone
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
        // Нужно динамически менять размер таблицы, чтобы scroll view прокручивался, иначе прокручивается только таблица
        heightOfTableView += cell.frame.height
        tableViewHeightConstraint.constant = heightOfTableView
        return cell
    }
}

