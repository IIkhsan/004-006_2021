//
//  ProfileViewController.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 30.09.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    
    @IBOutlet weak var profileSubscriptionsStackView: UIStackView!
    @IBOutlet weak var profileSubscribersStackView: UIStackView!
    @IBOutlet weak var profilePublicationsStackView: UIStackView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var logOutProfileButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var profileStatusLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var subscriptionsLabel: UILabel!
    @IBOutlet weak var subscriptionsCountLabel: UILabel!
    @IBOutlet weak var subscribersLabel: UILabel!
    @IBOutlet weak var subscribersCountLabel: UILabel!
    @IBOutlet weak var publicationsLabel: UILabel!
    @IBOutlet weak var publicationsCountLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    // MARK: - Initialization
    
    let dataManager = DataManager()
    let countOfPostImages: Int = 3
    var profilePostImages: [ProfilePost] = []
    var currentUser: User?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get current user and Set user data funcs call
        
        getCurrentUser()
        
        setUserData(currentUser: currentUser)
        
        // Initialization of delegate and datasource
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
        
        // Properties
        
        profileTableView.estimatedRowHeight = 100
    }
    
    // MARK: - Private funcs
    
    private func setUserData(currentUser: User?) {
        profileStatusLabel.text = currentUser?.profileStatus
        profileImageView.image = currentUser?.profileImageView
        subscriptionsCountLabel.text = currentUser?.profileSubscriptionsCount
        publicationsCountLabel.text = currentUser?.profilePublicationsCount
        subscribersCountLabel.text = currentUser?.profileSubscribersCount
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        subscribersLabel.text = "Подписчики"
        subscriptionsLabel.text = "Подписки"
        publicationsLabel.text = "Публикации"
        profileNameLabel.text = currentUser?.profileNickName
        profilePostImages = (currentUser?.profilePosts)!
    }
    
    private func getCurrentUser() {
        if let presentingViewController = presentingViewController as? ViewController, let currentUser = presentingViewController.user {
            self.currentUser = currentUser
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        (currentUser?.profilePosts.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentModel = currentUser?.profilePosts[indexPath.row]
        
        // DequeueReusableCell call
        
        guard let currentCell = tableView.dequeueReusableCell(withIdentifier: "profileTableViewCellReuseIdentifier", for: indexPath) as? ProfileTableViewCell
        else { return UITableViewCell() }
        
        currentCell.configureProfileTableViewCell(with: currentModel!)
        
        return currentCell
    }
    
    // MARK: - Prepare func
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileStatusSegue",
           let currentViewController = segue.destination as? ProfileStatusViewController,
           let user = sender as? User {
            currentViewController.currentUser = user
            currentViewController.delegate = self
        }
    }
    
    // Actions
    
    @IBAction func logOutProfileAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editProfileAction(_ sender: Any) {
        performSegue(withIdentifier: "profileStatusSegue", sender: currentUser)
    }
}

// MARK: - Profile view controller extansion

extension ProfileViewController: ProfileStatusViewControllerDelegate {
    
    // Change user data func 
    
    func changeUserData(currentUser: User?) {
        self.currentUser = currentUser
        setUserData(currentUser: currentUser)
    }
    
}
