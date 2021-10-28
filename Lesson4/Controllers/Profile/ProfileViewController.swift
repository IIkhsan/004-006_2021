//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate , UITableViewDelegate, UITableViewDataSource, DataTransferProtocol{
    
    // MARK: - Dependencies
    private let dataManager = DataManager()
    private var user = User()
    private var postsOfCurrentUser: [Post] = []
    
    // MARK: - Properties
    fileprivate let cellIdentifier = "cellIdentifier"
    fileprivate let segueIdentifier = "segueIdentifier"
    
    //MARK: - IBOUtlets
    @IBOutlet weak var profileTabBarItem: UITabBarItem!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastActivityLabel: UILabel!
    @IBOutlet weak var numberOfFriends: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        getPostsForCurrentUser()
        configure()
    }
    
    // MARK: - Private Functions
    private func getUser() {
        dataManager.getCurrentUser(){ user in
            self.user = user
        }
    }
    
    private func getPostsForCurrentUser() {
        dataManager.getPostsForCurrentUser { posts in
            self.postsOfCurrentUser = posts
            self.tableView.reloadData()
        }
    }
    
    private func configure() {
        tableView.backgroundColor = #colorLiteral(red: 0.8994444609, green: 0.8452375531, blue: 0.7285131812, alpha: 1)
        navigationController?.navigationBar.barTintColor =  #colorLiteral(red: 0.8994444609, green: 0.8452375531, blue: 0.7285131812, alpha: 1)
        profileTabBarItem?.badgeColor = UIColor.black
        nameLabel.font = UIFont.boldSystemFont(ofSize:20)
        hometownLabel.font = UIFont.systemFont(ofSize: 14)
        numberOfFriends.font = UIFont.systemFont(ofSize: 14)
        statusLabel.font = UIFont.systemFont(ofSize: 16)
        lastActivityLabel.font = UIFont.systemFont(ofSize: 16)
        avatarImageView.makeRoundAvatar()
        avatarImageView.image = user.avatarImage!
        nameLabel.text = user.name!
        hometownLabel.text = user.hometown!
        numberOfFriends.text =  user.numberOfFriends!
        statusLabel.text = user.status!
        lastActivityLabel.text = user.lastActivity!
        
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    // MARK: - UITableViewDelegate & DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsOfCurrentUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ) as!
            CustomTableViewCell
        
        cell.prepareCell(post: postsOfCurrentUser[indexPath.row])
        return cell
    }
    
    // MARK: - DataTransferProtocol    
    func didPressReturn(newStatus: String, newHometown: String, newName: String) {
        user.status = newStatus
        user.name = newName
        user.hometown = newHometown
        
        statusLabel.text = user.status
        hometownLabel.text = user.hometown
        nameLabel.text =  user.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let destinationController = segue.destination as! EditingUserInformationViewController
            
            destinationController.dataTransferDelegate = self
        }
    }
}
