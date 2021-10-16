//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - UI
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var martialStatusLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var instagramLabel: UILabel!
    
    //MARK: - Var
    var currentUser: User?
    
    //MARK: - View controller's cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentUser()
        setUserData(user: currentUser)
    }
    
    
    
    //MARK: - Get current user and set data
    private func getCurrentUser() {
        if let presentingViewController = presentingViewController as? LoginViewController, let currentUser = presentingViewController.user {
            self.currentUser = currentUser
        }
    }
        
    private func setUserData(user: User?) {
        profileImageView.image = user?.profileImage
        nickLabel.text = user?.nick
        statusLabel.text = user?.status
        cityLabel.text = user?.city
        educationLabel.text = user?.education
        workLabel.text = user?.work
        martialStatusLabel.text = user?.martialStatus
        phoneNumberLabel.text = user?.phoneNumber
        instagramLabel.text = user?.instagram
    }
    
    //MARK: - Log out and change status buttons
    @IBAction func logOutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeStatusSegue", let viewController = segue.destination as? ChangeStatusViewController, let user = sender as? User {
            viewController.currentUser = user
            viewController.delegate = self
        }
    }
    
    @IBAction func changeStatusActionButton(_ sender: Any) {
        performSegue(withIdentifier: "changeStatusSegue", sender: currentUser)
    }

}

//MARK: - Change status view controller delegate
extension ProfileViewController: ChangeStatusViewControllerDelegate {
    func changeData(user: User) {
        currentUser = user
        setUserData(user: currentUser)
    }
}
