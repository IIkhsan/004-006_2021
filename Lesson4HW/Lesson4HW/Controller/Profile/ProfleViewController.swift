//
//  ProfleViewController.swift
//  Lesson4HW
//
//  Created by Тимур Миргалиев on 04.10.2021.
//

import UIKit

protocol personHowLogIn {
    func getPersonHowLogIn()
}

class ProfleViewController: UIViewController {
    
    var arrayOfPosts: [Post] = []
    
    let generator = GeneratorForProfile()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LABELS
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var webStasusLabel: UILabel!
    @IBOutlet weak var townOfLivingLabel: UILabel!
    @IBOutlet weak var schoolOrUniversityLabel: UILabel!
    @IBOutlet weak var folowersLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var changeStatusButtonNoAction: UIButton!
    
    @IBOutlet var headerView: UIView!
    
    // MARK: - IMAGES
    @IBOutlet weak var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActionHandlers()
        changeStatusButtonNoAction.backgroundColor = .blue
        changeStatusButtonNoAction.layer.cornerRadius = changeStatusButtonNoAction.frame.height / 2
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Выйти", style: .done, target: self, action: #selector(exitFromAccaunt))
        self.navigationItem.rightBarButtonItem?.tintColor = .red
        for i in 0..<FeedViewConroller.dataSource.count {
            if FeedViewConroller.dataSource[i].name == ViewController.personHowLogIn[0].name {
                arrayOfPosts.append(FeedViewConroller.dataSource[i])
                
            }
        }
        generator.generateProfile(name: nameLabel, town: townOfLivingLabel, school: schoolOrUniversityLabel, folowers: folowersLabel, webStatus: webStasusLabel, avatar: profileImage, imageForAvatar: arrayOfPosts[0].avatar ?? "1")
        tableView.estimatedRowHeight = 60
        
    }
    
    // MARK: - Actions
    
    private func addActionHandlers() {
        changeStatusButtonNoAction.addTarget(
            self, action: #selector(editStatusButtonClicked),
            for: .touchUpInside
        )
    }
    
    @objc
    private func editStatusButtonClicked() {
        guard let changeStatusViewController = UIStoryboard(
            name: "ChangeStatus", bundle: .main
        ).instantiateViewController(
            withIdentifier: "ChangeStatus"
        ) as? ChangeStatusViewController
        else { return }
        changeStatusViewController.delegate = self
        navigationController?.pushViewController(changeStatusViewController, animated: true)
    }
    
    @objc
    func exitFromAccaunt(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
        FeedViewConroller.dataSource.removeAll()
        
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ProfleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return headerView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! ProfileTableViewCell
        cell.configure(text: arrayOfPosts[indexPath.row].name ?? "defaultName",
                       avatar: arrayOfPosts[indexPath.row].avatar ?? "1",
                       messageText: arrayOfPosts[indexPath.row].textOfPost ?? "defaultText",
                       imagePost: arrayOfPosts[indexPath.row].imageOfOfPost ?? "1",
                       dateOfPost: arrayOfPosts[indexPath.row].datePost ?? "01.091.2000")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailProfileViewController") as? DetailProfileViewController else {
            return
        }
        vc.post = arrayOfPosts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - ChangerStatusDelegate

extension ProfleViewController: ChangerStatusDelegate {
    func changeStatus(with status: String?) {
        statusLabel.text = status
    }
}
