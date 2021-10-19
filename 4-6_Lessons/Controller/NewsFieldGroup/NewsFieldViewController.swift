//
//  NewsFieldViewController.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 29.09.2021.
//

import UIKit

class NewsFieldViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    
    @IBOutlet weak var newsFieldTableView: UITableView!
    
    // MARK: - Initialization
    
    var currentUser: User?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get current user func call
        
        getCurrentUser()
        
        // Initialization of delegate and datasource
        
        newsFieldTableView.delegate = self
        newsFieldTableView.dataSource = self
        
        // Register XIB
        
        newsFieldTableView.register(UINib(nibName: "NewsFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "newsFieldTableViewCellReuseIdentifier")
        
        // Properties
        
        newsFieldTableView.estimatedRowHeight = 200
    }
    
    // MARK: - Private funcs
    
    private func getCurrentUser() {
        if let presentingViewController = presentingViewController as? ViewController,
           let currentUser = presentingViewController.user {
            self.currentUser = currentUser
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentUser?.userPosts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentModel = currentUser?.userPosts[indexPath.row],
        
        // DequeueReusableCell call
        
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "newsFieldTableViewCellReuseIdentifier", for: indexPath) as? NewsFieldTableViewCell
        else { return UITableViewCell() }
        
        currentCell.configureNewsFieldTableViewCell(with: currentModel)
        
        return currentCell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = currentUser?.userPosts[indexPath.row]
        let segueIdentifier = "newsFieldDetailIdentifier"

        performSegue(withIdentifier: segueIdentifier, sender: model)
    }
    
    // MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newsFieldDetailIdentifier",
           let destinationController = segue.destination as? NewsFieldDetailViewController,
           let newsFieldPost = sender as? NewsFieldPost {
            destinationController.newsFieldDetailPost = newsFieldPost
        }
    }
    
    // MARK: - Prepare content func
    
//    func prepareContent() {
//        dataManager.getDataForNewsField { [unowned self] newsFieldPostsTemp in
//            self.newsFieldPosts = newsFieldPostsTemp
//        }
//    }
}
