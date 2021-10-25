//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Alexandr Onischenko on 01.10.2021.
//

import UIKit

class FeedViewController: UITableViewController {
    
    // MARK: - Properties
    var dataManager = DataManager()
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCustomCell(PostTableViewCell.self)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.posts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier(), for: indexPath) as? PostTableViewCell else { return PostTableViewCell()}
        
        guard let post = user.posts?[indexPath.row] else{
            return cell
        }
        cell.configure(with: post)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = user.posts?[indexPath.row]
        
        let detailsViewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailsViewController.post = post
        
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsViewController", let post = sender as? Post {
            let destinationController = segue.destination as? DetailsViewController
            
            destinationController?.post = post
        }
    }
}

// MARK: - Extenstion realization protocol CUSTOMCELL
extension UITableView{
    func registerCustomCell(_ cell: CustomCell.Type) {
        self.register(cell.cellNib(), forCellReuseIdentifier: cell.cellIdentifier())
    }
}
