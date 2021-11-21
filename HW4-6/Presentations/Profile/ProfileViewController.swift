//
//  ProfileViewController.swift
//  HW4-6
//
//  Created by Arslan Rashidov on 18.11.2021.
//

import UIKit

class ProfileViewController: UIViewController, EditStatusDelegate{

    // MARK: - UI
    
    @IBOutlet var profilePictureImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var educationLabel: UILabel!
    @IBOutlet var workLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var subcribersLabel: UILabel!
    
    @IBAction func onEditButtonAction(_ sender: Any) {
        startEdit()
    }
    
    // MARK: - Properties
    
    var userID: String?
    var usersData: [Dictionary<String, [String]>] = [
        ["0": ["Арслан Рашидов", "Все кул", "КФУ ИТИС", "Безработный", "Казань", "1 января", "23 подписчика"]],
        ["1": ["Агига Уцыев", "Работаю", "СПбГУ", "На шабашке", "Питер", "20 марта", "0 подписчиков"]],
        ["2": ["Настя Уцыева", "Вышла замуж", "МГУ", "В банке", "Москва", "31 декабря", "541 подписчик"]]
    ]
    var usersPhotoData: [Dictionary<String, UIImage>] = [
        ["0": UIImage(named: "UserPhoto0")!],
        ["1": UIImage(named: "UserPhoto1")!],
        ["2": UIImage(named: "UserPhoto2")!]
    ]
    
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userID = globalUserID!
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log out", style: .done, target: self, action: #selector(click(sender:)))
        
        configureView()
    }
    
    // MARK: - Private Methods
    
    @objc private func click(sender: AnyObject) {
        let parentNav = self.navigationController?.navigationController
        if let vcB = parentNav?.viewControllers.first(where: { $0 is LoginViewController }) {
            parentNav?.popToViewController(vcB, animated: true)
        }
    }
    
    private func startEdit() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "EditStatusViewController") as! EditStatusViewController
        vc.userData = getUserData(enteredUserID: userID!)
        vc.delegate = self
        navigationController?.present(vc, animated: true)
    }
    
    private func configureView() {
        let enteredUserID = userID ?? "0"
        let userData = getUserData(enteredUserID: enteredUserID)
        
        let userName = userData[enteredUserID]![0]
        let userStatus = userData[enteredUserID]![1]
        let userEducation = userData[enteredUserID]![2]
        let userWork = userData[enteredUserID]![3]
        let userPlace = userData[enteredUserID]![4]
        let userBirthday = userData[enteredUserID]![5]
        let userSubscribers = userData[enteredUserID]![6]
        let userPhoto = usersPhotoData[Int(enteredUserID)!][enteredUserID]
        
        profilePictureImageView.image = userPhoto
        profilePictureImageView.setRounded()
        profileNameLabel.text = userName
        statusLabel.text = userStatus
        educationLabel.text = userEducation
        workLabel.text = userWork
        placeLabel.text = userPlace
        birthdayLabel.text = userBirthday
        subcribersLabel.text = userSubscribers
                
                
        }

    private func getUserData(enteredUserID: String) -> Dictionary<String, [String]> {
        for i in 0..<usersData.count{
            let userID: String = usersData[i].keys.first!
            if userID == enteredUserID{
                return usersData[i]
            }
        }
        return Dictionary<String, [String]>()
    }
    
    internal func userDidEnterInformation(ID: String, status: String) {
        for i in 0..<usersData.count{
            let userID: String = usersData[i].keys.first!
            if userID == ID{
                usersData[i][ID]![1] = status
            }
        configureView()
        print(usersData)
        }
    }

}
