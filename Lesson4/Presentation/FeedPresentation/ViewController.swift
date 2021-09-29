//
//  ViewController.swift
//  Lesson4
//
//  Created by i.ikhsanov on 28.09.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let customView = UIView()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }


    func config() {
        customView.backgroundColor = .orange
        view.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        let topConstraint = customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        
        customView.widthAnchor.constraint(equalToConstant: 100) .isActive = true
        customView.heightAnchor.constraint(equalToConstant: 100) .isActive = true
        
        NSLayoutConstraint.activate([leadingConstraint, topConstraint])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else { return UITableViewCell() }
        if indexPath.row % 2 == 0 {
            cell.configure(image: nil, description: "fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde")
        } else {
            cell.configure(image: "fsd", description: "fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde fsde")
        }
        return cell
    }
}

