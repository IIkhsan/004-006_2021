//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Алексей Горбунов on 24.10.2021.
//

import UIKit

class FeedViewController: UIViewController {

    //MARK: - Properties
    var user = User()
    
    //MARK: - Outlets
    @IBOutlet weak var feedTableView: UITableView!
    
    //MARK: - View Contoller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
        self.navigationItem.title = user.login
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewDidLoad()
    }
    
    //MARK: - Private Functions
    private func getUser() {
        guard let user = DataManager.user else { return }
        self.user = user
    }
}

//MARK: - Table View Data Source
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let postVC = storyboard.instantiateViewController(withIdentifier: "PostViewController") as? PostViewController
        
        postVC?.post = user.feed[indexPath.row]
        postVC?.setUnknownUser()
        
        navigationController?.pushViewController(postVC!, animated: true)
    }
}

//MARK: - Table View Delegate
extension FeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let postCell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        postCell.setData(post: user.feed[indexPath.row])
        postCell.setUnknownUser()
        
        return postCell
    }
}

