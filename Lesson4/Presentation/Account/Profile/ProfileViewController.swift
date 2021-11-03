//
//  AccountViewController.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 12.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    //MARK: - Properties
    var user = User()
    var mainCell: MainTableViewCell?
    var infoCell: InfoTableViewCell?
    var postCell: PostTableViewCell?
    
    //MARK: - Outlets
    @IBOutlet weak var profileTableView: UITableView!
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: Any) {
        didTapButton()
    }
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAccount()
        
        profileTableView.delegate = self
        profileTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    //MARK: - Private Functions
    private func configureAccount() {
        getUser()
        self.navigationItem.title = user.login
        addButton()
    }
    
    private func getUser() {
        guard let user = DataManager.user else { return }
        self.user = user
    }
}

//MARK: - Table View Data Source
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row > 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
            
            postVC?.post = user.posts[indexPath.row - 3]
            postVC?.setUser(user: user)
            
            navigationController?.pushViewController(postVC!, animated: true)
        }
    }
}

//MARK: - Table View Delegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.posts.count + 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let mainCell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
            
            mainCell.setData(user: user)
            self.mainCell = mainCell
            
            return mainCell
        }
        
        if indexPath.row == 1 {
            guard let infoCell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else { return UITableViewCell() }
            
            infoCell.setData(user: user)
            self.infoCell = infoCell
            
            return infoCell
        }
        
        if indexPath.row == 2 {
            let friendsCell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath)

            return friendsCell
        }
        
        guard let postCell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        postCell.setData(post: user.posts[indexPath.row - 3])
        postCell.setUser(user: user)
        
        self.postCell = postCell
        
        return postCell
    }
}

//MARK: - Add Button
extension ProfileViewController {
    private func addButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "gear"),
            style: .done,
            target: self,
            action: #selector(didTapButton))
    }
    
    @objc func didTapButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editVC = storyboard.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController
        
        editVC?.user = user
        editVC?.delegateMainCell = mainCell
        editVC?.delegateInfoCell = infoCell
        editVC?.delegatePostCell = postCell
        
        navigationController?.pushViewController(editVC!, animated: true)
    }
}
