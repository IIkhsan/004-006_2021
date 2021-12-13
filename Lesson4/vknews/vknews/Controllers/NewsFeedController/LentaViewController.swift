//
//  LentaViewController.swift
//  vknews
//
//  Created by itisioslab on 27.09.2021.
//

import UIKit

class LentaViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    private let postService = PostService()
    private var Info:[SinglePostCellData] = []
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        obtainData()
    }
    
    // MARK: - Private function
    private func obtainData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.postService.getNews{ data in
                DispatchQueue.main.async {
                    strongSelf.Info = data
                    strongSelf.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Exstensions
extension LentaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.configure(post: Info[indexPath.row])
        return cell
    }
}
    
extension LentaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailedPostViewController = storyboard.instantiateViewController(withIdentifier: "DetailedPostViewController") as? DetailedPostViewController else { return }
        navigationController?.pushViewController(detailedPostViewController, animated: true)
        detailedPostViewController.post = Info[indexPath.row]
    }
}

