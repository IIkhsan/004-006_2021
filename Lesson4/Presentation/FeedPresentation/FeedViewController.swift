//
//  ViewController.swift
//  Lesson4
//
//  Created by i.ikhsanov on 28.09.2021.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //vars
    let customView = UIView()
    public var feedId: Int = 0
    
    //IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabBar: UITabBarItem!
    
    
    //funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        UITabBar.appearance().barTintColor = UIColor.white
    }
}

//extensions
extension FeedViewController {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        var post = posts[indexPath.row]
        
        let feedId = vc.feedId
        print(feedId)
        
        if feedId == 0 {
            post = posts[indexPath.row]
        }
        else if (feedId == 1) {
            post = posts1[indexPath.row]
        }
        else {
            post = posts2[indexPath.row]
        }
        print(post)
            
        if post.picture == nil {
            return 220
        } else if post.description == "" {
            return 320
        }
        return 520
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let postCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        if (feedId == 0) {
            postCell.setData(post: posts[index])
        }
        else if (feedId == 1) {
            postCell.setData(post: posts1[index])
        }
        else if (feedId == 2) {
            postCell.setData(post: posts2[index])
        }
        else {
            postCell.setData(post: posts[index])
        }
        
        return postCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
}



