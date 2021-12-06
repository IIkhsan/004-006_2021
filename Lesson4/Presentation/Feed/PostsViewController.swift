//
//  PostsViewController.swift
//  Lesson4
//
//  Created by Marat Giniyatov on 11.11.2021.
//


import UIKit

class PostsViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var postData: [Post] = []
    let dataService: DataService = DataService()
    
    // MARK: -  VC Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        dataService.makePostData(completion: getPosts(_:))
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: - Method for getting posts
    func getPosts(_ posts: [Post]) {
        for post in posts {
            postData.append(post)
        }
    }

}
 
// MARK: - Table View extension
extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {return UITableViewCell() }
        cell.configurePost(post: postData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    
    
}
 
