//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Милана Махсотова on 03.10.2021.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: - Properties
    fileprivate let cellIdentifier = "customCellIdentifier"
    private let dataManager = DataManager()
    private var posts: [Post] = []    
    
    //MARK: - IBOutlets
    @IBOutlet weak var feedTabBarItem: UITabBarItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getPosts()
    }
    
    //MARK: - Private functions
    
    private func configure() {
        feedTabBarItem?.badgeColor = UIColor.black
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.estimatedRowHeight = 100
    }
    
    private func getPosts() {
        DispatchQueue.global(qos: .utility).sync { [weak self] in
            guard let strongSelf =  self else { return }
            strongSelf.dataManager.getPosts { data in
                DispatchQueue.main.async {
                    strongSelf.posts = data
                    strongSelf.tableView.reloadData()
                }
            }
        }
    }
    
    //MARK: - UITabelView Delegate & DataSource
    
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
        performSegue(withIdentifier: "segueIdentifier", sender: post)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueIdentifier", let viewController = segue.destination as? PostDetailViewController,
        let post = sender as? Post {
            viewController.post = post
        }
    }
 
}


