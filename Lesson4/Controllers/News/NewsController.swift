//
//  NewsController.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 18.10.2021.
//

import UIKit

class NewsController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var newsTableView: UITableView!
    

    // MARK: - private properties
    private func setNews(_ generatedPosts: [Post]) -> Void {
        posts = generatedPosts
    }
    private let postService = PostService()
    private var currentUser: User?
    private var posts: [Post] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.rowHeight = UITableView.automaticDimension;
        newsTableView.estimatedRowHeight = 500.0
        currentUser = (tabBarController! as! TabBarController).getCurrentUser()
        postService.generateNews(completion: setNews(_:), user: currentUser)
    }
    
}

// MARK: - extensions
extension NewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.setData(post: posts[indexPath.row])
        return cell
    }
}

extension NewsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
