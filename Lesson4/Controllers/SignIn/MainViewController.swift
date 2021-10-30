//
//  MainViewController.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 17.10.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    // MARK: - IBAction
    @IBAction func signInTouch(_ sender: Any) {
        guard let tabBarController = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else { return }
        navigationController?.pushViewController(tabBarController, animated: true)
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "IntroSet")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
           self.view.insertSubview(backgroundImage, at: 0)
    }
}
