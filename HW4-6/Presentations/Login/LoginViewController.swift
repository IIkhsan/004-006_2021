//
//  LoginViewController.swift
//  HW4-6
//
//  Created by Arslan Rashidov on 18.11.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    
    // MARK: - UI
    
    @IBOutlet var MailTextField: UITextField!
    
    @IBOutlet var PasswordTextField: UITextField!
    
    @IBAction func LoginButtonAction(_ sender: Any) {
        if checkValidation(){
            let userID: String = checkIfDataExists()
            if(userID != "-1"){
                loginToNewsfeed(userID: userID)
            }
        }
    }
    
    // MARK: - Properties
    var peopleData: [Dictionary<String, Dictionary<String, String>>] = [
        ["0":["ars@mail.ru":"1qwertyu"]],
        ["1":["mmm@mail.ru":"2qwertyu"]],
        ["2":["aaa@mail.ru":"3qwertyu"]]
    ]
    
    
    // MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Methods
    private func checkIfDataExists() -> String {
        let enteredMail: String = MailTextField.text ?? ""
        let enteredPassword: String = PasswordTextField.text ?? ""
        
        for i in 0...peopleData.count-1{
            let userID: String = peopleData[i].keys.first!
            let userLoginAndPassword: Dictionary<String, String> = peopleData[i][userID]!
            
            if userLoginAndPassword == [enteredMail: enteredPassword]{
                return userID
            }
        }
        return "-1"
    }
    
    private func loginToNewsfeed(userID: String) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "MainTabBarController")
        
        globalUserID = userID
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func checkValidation() -> Bool {
        let enteredMail: String = MailTextField.text ?? ""
        let enteredPassword: String = PasswordTextField.text ?? ""
        do {
        
        let range1 = NSRange(location: 0, length: enteredMail.utf16.count)
        let regex1 = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let result1 = regex1.firstMatch(in: enteredMail, range: range1)
        if result1 != nil{
            let range2 = NSRange(location: 0, length: enteredPassword.utf16.count)
            let regex2 = try NSRegularExpression(pattern: "^[a-zA-Z0-9]{6,}$")
            let result2 = regex2.firstMatch(in: enteredPassword, range: range2)
            if result2 != nil{
                return true
            }
            showPasswordValidationError()
            return false
        }
        showEmailValidationError()
        return false
        }
        catch {
            return false
        }
    }
    
    private func showEmailValidationError() {
        let alert = UIAlertController(title: "Error!", message: "Please enter real email!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func showPasswordValidationError() {
        let alert = UIAlertController(title: "Error!", message: "Please enter real password!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
