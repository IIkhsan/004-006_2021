//
//  LentaViewController.swift
//  vknews
//
//  Created by itisioslab on 27.09.2021.
//

import UIKit

class LentaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
   }
}

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

