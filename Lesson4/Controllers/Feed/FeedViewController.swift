//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 03.10.2021.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Dependencies
    private let dataManager = DataManager()
    private var posts: [Post] = []
    
    // MARK: - Properties
    fileprivate let cellIdentifier = "customCellIdentifier"
    fileprivate let segueIdentifier = "segueIdentifier"
    
    // MARK: - IBOutlets
    @IBOutlet weak var feedTabBarItem: UITabBarItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getPosts()
    }
    
    // MARK: - Private functions
    private func configure() {
        feedTabBarItem?.badgeColor = UIColor.black
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8994444609, green: 0.8452375531, blue: 0.7285131812, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 0.8994444609, green: 0.8452375531, blue: 0.7285131812, alpha: 1)
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 100
    }
    
    private func getPosts() {
        dataManager.getPosts { posts in
            self.posts = posts
            self.tableView.reloadData()
        }
    }
    
    // MARK: - UITabelView Delegate & DataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier ) as!
            CustomTableViewCell
        
        cell.prepareCell(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        performSegue(withIdentifier: segueIdentifier, sender: post)
        tableView.deselectRow(at: indexPath, animated: true)
    }    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier, let viewController = segue.destination as? PostDetailViewController,
           let post = sender as? Post {
            viewController.post = post
        }
    }
}
