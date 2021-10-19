//
//  ProfileViewController.swift
//  Lesson3
//
//  Created by Рустем on 18.10.2021.
//

import UIKit

protocol ChangeNameDelegate: AnyObject {
    func update(newName: String)
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = data.currentUser.profileImage
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        nameLabel.text = data.currentUser.name
    }
    
    @IBAction func goToEditPage(_ sender: UIBarButtonItem) {
        guard let editVC = storyboard?.instantiateViewController(withIdentifier: "EditViewController") as? EditViewController else {return}
        editVC.changeNameDelegate = self
        navigationController?.pushViewController(editVC, animated: true)
    }
    
}

extension ProfileViewController: ChangeNameDelegate {
    func update(newName: String) {
        data.currentUser.name = newName
        nameLabel.text = newName
    }
    
    
}
