//
//  TableViewController.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//

import UIKit

class TableViewController: UIViewController {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //    MARK: - Private properties
    
    private let dataManager = DataManager()
    private var posts:[Post] = []
    
    
    //    MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        obtainData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reloadUsernames()
    }
    
    
    //    MARK: - Private functions
    
    private func obtainData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.getPosts { data in
                DispatchQueue.main.async {
                    strongSelf.posts = data
                    strongSelf.tableView.reloadData()
                }
            }
        }
    }
    
    private func reloadUsernames() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.dataManager.reloadUsernames { data in
                DispatchQueue.main.async {
                    strongSelf.posts = data
                    strongSelf.tableView.reloadData()
                }
            }
        }
    }
}

//    MARK: - Table view


extension TableViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PostTableViewCell else { return UITableViewCell() }
        
        cell.configure(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let post = posts[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PostDetailViewController") as! PostDetailViewController
        vc.post = post
        
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TableViewController : UITableViewDelegate{
    
}
