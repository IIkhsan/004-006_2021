//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 10.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var profileHeaderImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var changeStatusButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    //MARK: - Var
    var currentUser: User?
    
    // MARK: -  View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentUser()
        setUserData(user: currentUser!)
        makeBordersGray(element: changeStatusButton)
        makeImageViewRound(image: accountImageView)
        makeBordersGray(element: logoutButton)
    }
    
    // Private functions
    private func makeBordersGray(element: UIView) {
        element.layer.borderWidth = 1
        element.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    private func makeImageViewRound(image: UIImageView) {
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
    }
    
    private func getCurrentUser() {
        if let presentingViewController = presentingViewController as? LogInViewController, let currentUser = presentingViewController.user {
            self.currentUser = currentUser
        }
    }
    
    private func setUserData(user: User) {
        profileHeaderImageView.image = user.profileHeader
        usernameLabel.text = user.username
        accountNameLabel.text = user.accountName
        statusLabel.text = user.status
        followingCountLabel.text = String(Int.random(in: 0...100000))
        followersCountLabel.text = String(Int.random(in: 0...100000))
        accountImageView.image = user.accountImage
    }
    
    //Override funcion
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "changeStatusSegue", let viewController = segue.destination as? ChangeStatusViewController, let user = sender as? User {
            viewController.currentUser = user
            viewController.delegate = self
        }
    }
    
    //MARK: - IBActions
    @IBAction func changeStatusActionButton(_ sender: Any) {
        performSegue(withIdentifier: "changeStatusSegue", sender: currentUser)
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - ProfileViewController
extension ProfileViewController: ChangeStatusViewControllerDelegate {
    func changeData(user: User) {
        currentUser = user
        setUserData(user: currentUser!)
    }
}
