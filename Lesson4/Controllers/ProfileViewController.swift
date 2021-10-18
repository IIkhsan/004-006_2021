//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by andrewoch on 14.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //    MARK: - Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    //    MARK: - Properties
    
    var user:User?
    
    
    //    MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        navigationItem.title = "Профиль"
    }
    
    //    MARK: - Actions
    
    @IBAction func editAccountButtonPressed(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "EditUserViewController") as! EditUserViewController
        vc.user = user
        vc.delegate = self
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func exitAccountButtonPressed(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "currentUserId")
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    func configure(){
        user = DataManager.getCurrentUser()
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
    }
}

extension ProfileViewController: EditUserDelegate{
    func reloadUserData(user: User?) {
        self.user = user
        usernameLabel.text = user?.username
        emailLabel.text = user?.email
    }
}
