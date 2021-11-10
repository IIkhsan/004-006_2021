//
//  LogInViewController.swift
//  vknews
//
//  Created by itisioslab on 04.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var nickField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var validator: Validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logIn(_ sender: Any) {
        if nickField.text == "1" && passwordField.text == "1" {
            
            guard let tabBarViewController = storyboard?.instantiateViewController(identifier: "TabBarViewController") as? UITabBarController else { return }
            navigationController?.pushViewController(tabBarViewController, animated: true)} else{
                UIView.animate(withDuration: 0.5, animations: {
                                //self.refuse.alpha = 1
                    
                })
                UIView.animate(withDuration: 0.5, animations: {
                                //self.refuse.alpha = 0
                    
                })
                passwordField.text = ""
                
            }
    }
}
