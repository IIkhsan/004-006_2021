//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    //MARK: - UI
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Var
    var feedSerive = FeedService()
    var data: [Post] = []
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareContent()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 150
    }
    
    //MARK: - Private func to get data
    private func prepareContent() {
        feedSerive.getData(completion: processingPosts)
    }
    
    private func processingPosts(_ posts: [Post]) {
        posts.forEach { post in
            data.append(post)
        }
    }
}

// MARK: - Table view data source and delegate
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        cell.makePost(post: data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
