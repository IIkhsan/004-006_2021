//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Artem Kalugin on 06.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    // Outlet properties
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // MARK: - Button actions
    @IBAction func detailButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "DetailProfileViewController") as! DetailProfileViewController
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func logOutButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "StartScreenViewController") as! StartScreenViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func changePersonalInformationButtonAction(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "ChangeInformationViewController") as! ChangeInformationViewController
        
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Private functions
    private func configure() {
        avatarImageView.image = UIImage(named: userNow.avatar)
        nicknameLabel.text = userNow.nickname
        fullNameLabel.text = userNow.firstName + " " + userNow.secondName
    }
}

// MARK: - ChangeInformationViewControllerDelegate
extension ProfileViewController: ChangeInformationViewControllerDelegate {
    func changeUserNow(user: User) {
        for key in db.keys {
            if db[key]?.id == userNow.id {
                userNow = db[key] ?? userNow
            }
        }
    }
}
