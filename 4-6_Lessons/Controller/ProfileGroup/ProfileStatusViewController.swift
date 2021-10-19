//
//  ProfileStatusViewController.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 17.10.2021.
//

import UIKit

// MARK: - Profile status view controller delegate protocol

protocol ProfileStatusViewControllerDelegate: AnyObject {
    
    // Change user data func
    
    func changeUserData(currentUser: User?)
}

class ProfileStatusViewController: UIViewController {
    
    // Outlets

    @IBOutlet weak var profileStatusView: UIView!
    @IBOutlet weak var profileStatusImageView: UIImageView!
    @IBOutlet weak var profileStatusHeadingLabel: UILabel!
    @IBOutlet weak var profileStatusTextField: UITextField!
    @IBOutlet weak var profileStatusSaveChangesButton: UIButton!
    
    // Initialization of delegate and other properties
    
    weak var delegate: ProfileStatusViewControllerDelegate?
    var currentUser: User?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileDetailData()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private funcs
    
    private func setProfileDetailData() {
        profileStatusHeadingLabel.text = "Write new status"
        profileStatusImageView.image = currentUser?.profileImageView
        profileStatusImageView.layer.cornerRadius = profileStatusImageView.frame.size.height / 2
    }
    
    // Actions
    
    @IBAction func profileStatusSaveChangesAction(_ sender: Any) {
        guard var currentUser = currentUser else { return }
        currentUser.profileStatus = profileStatusTextField.text ?? ""
        delegate?.changeUserData(currentUser: currentUser)
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
