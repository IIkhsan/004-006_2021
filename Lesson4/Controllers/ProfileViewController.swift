//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Алсу Хайруллина on 19.10.2021.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
    func update(text: String)
}

class ProfileViewController: UIViewController, ProfileViewControllerDelegate {
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? StatusViewController else { return }
            destination.delegate = self
        }
        
        func update(text: String) {
            statusButton.setTitle(text, for: .normal)
        }
    
    let dataManager = DataManager()
    
    var filteredPosts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareContent()
        tableView.dataSource = self

    }
    
    private func prepareContent() {
            dataManager.getPosts(completion: processingPost(_:))
    }
    
    func processingPost(_ posts: [Post]) {
            posts.forEach { post in
                filteredPosts.append(post)
            }
        }

    func updateUser (user: User) {
        profileImage.image = user.profileImage
        userName.text = user.name
        cityLabel.text = user.city
        phoneLabel.text = user.phoneNumber
        sexLabel.text = user.sex
    }
    //Action buttons
    @IBAction func didLogOutButton(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Table view data source and delegate
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPosts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"PostCell", for: indexPath) as! PostTableViewCell
        cell.updatePosts(post: filteredPosts[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

