//
//  FeedViewConroller.swift
//  Lesson4
//
//  Created by Тимур Миргалиев on 03.10.2021.
//

import UIKit

let generator = GeneratorForPosts()

class FeedViewConroller: UIViewController {
    
    let postService = PostService()
    
    @IBOutlet weak var tableView: UITableView!
    
    static var dataSource: [Post] = []
    var posts: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generator.setNamePersonWichLogIn()
        prepareContent()
        
        tableView.estimatedRowHeight = 40
    }
    
    private func prepareContent() {
        postService.getData(completion: processingPost(comePosts:))
        postService.getDataPerson(completion: processingPost(comePosts:))
    }
    
    private func processingPost(comePosts: [Post]) {
        comePosts.forEach { post in
            FeedViewConroller.dataSource.append(post)
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension FeedViewConroller: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedViewConroller.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.configure(text: FeedViewConroller.dataSource[indexPath.row].name ?? "defaultName",
                       avatar:FeedViewConroller.dataSource[indexPath.row].avatar ?? "image1",
                       messageText:FeedViewConroller.dataSource[indexPath.row].textOfPost ?? " ",
                       imagePost:FeedViewConroller.dataSource[indexPath.row].imageOfOfPost ?? "image1",
                       dateOfPost:FeedViewConroller.dataSource[indexPath.row].datePost ?? "01.01.2000")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        vc.post = FeedViewConroller.dataSource[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

