//
//  FeedsViewController.swift
//  Lesson4
//
//  Created by Роман Сницарюк on 01.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    // MARK: - UI
    @IBOutlet weak var mainTableView: UITableView!
    
    // MARK: - Properties
    private var posts: [Post] = []
    
    // Dependencies
    private let dataManager = DataManager()
    
    // MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        obtainData()
    }
     
    // MARK: - Private
    private func configure() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.estimatedRowHeight = 400
    }
    
    private func obtainData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.getPosts { data in
                DispatchQueue.main.async {
                    strongSelf.posts = data
                    strongSelf.mainTableView.reloadData()
                }
            }
        }
    }
    
    // MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailedPostSeque.rawValue,
               let viewController = segue.destination as? DetailedPostViewController,
                let post = sender as? Post {
                    viewController.post = post
        }
    }
}

// MARK: - TableViewDelegate && TableViewDataSource
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        cell.configure(posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           tableView.deselectRow(at: indexPath, animated: true)
           let post = posts[indexPath.row]
           performSegue(withIdentifier: Constants.detailedPostSeque.rawValue, sender: post)
    }
}
