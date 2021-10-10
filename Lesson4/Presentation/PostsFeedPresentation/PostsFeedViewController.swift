//
//  PostsFeedViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 04.10.2021.
//

import UIKit

class PostsFeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var posts: [Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        
        posts = [Post.init(user: User.init(username: "DUNE", accountName: "@dunemovie", accountImage: #imageLiteral(resourceName: "duneAccountImage")), postText: "A mythic and emotionally charged hero's journey,'Dune' tells the story of Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people.", postDate: "4 oct 2021", postImage: #imageLiteral(resourceName: "dunePostImage")),
        .init(user: User.init(username: "Netflix", accountName: "@netflix", accountImage: #imageLiteral(resourceName: "netflixAccountImage")), postText: "A new look at ‘STRANGER THINGS’ Season 4.", postDate: "5 sep 2021", postImage: nil),
        .init(user: User.init(username: "Cats", accountName: "@cats", accountImage: #imageLiteral(resourceName: "catsAccountImage")), postText: nil, postDate: "21 sep 2020", postImage: #imageLiteral(resourceName: "catPostImage"))]
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}
    
    extension PostsFeedViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsFeedTableViewCell", for: indexPath) as? PostsFeedTableViewCell else { return UITableViewCell()}
            cell.config(post: posts[indexPath.row])
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let cell = posts[indexPath.row]
            performSegue(withIdentifier: "PostViewControllerSegue", sender: cell)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "PostViewControllerSegue", let viewController = segue.destination as? PostViewController, let post = sender as? Post {
                viewController.post = post
            }
        }
    }



