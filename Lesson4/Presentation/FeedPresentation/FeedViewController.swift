//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 01.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    var posts: [Post] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        fillPosts()
    }
    
    private func fillPosts() {
        for _ in 0...10 {
            posts.append(createPost())
        }
    }

}

extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"FeedTableViewCell", for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        cell.setPost(post: posts[indexPath.row])
    
        return cell as UITableViewCell
    }
    
    // Было бы хорошо сделать 2 конструктора для поста (первый для ячеек с текстом, второй - для ячеек без текста), но так как задание требует несколько видов ячеек, пришлось подгонять сами посты под ячейки
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        print(cells[indexPath.row])
//        print(posts[indexPath.row].shortText)
//
//        if cells[indexPath.row] is CustomTableViewCell{
//            let vc = sb.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
//            vc.post = posts[indexPath.row]
//            navigationController?.present(vc, animated: true, completion: nil)
//        } else {
//            let vc = sb.instantiateViewController(identifier: "PhotoDetailViewController") as! PhotoDetailViewController
//            vc.post = posts[indexPath.row]
//            navigationController?.present(vc, animated: true, completion: nil)
//        }
//    }
}

