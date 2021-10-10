//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 10.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var editProfileButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBordersGray(element: editProfileButton)

    }
    
    func makeBordersGray(element: UIView) {
            element.layer.borderWidth = 1
            element.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
