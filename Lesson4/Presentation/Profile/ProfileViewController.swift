//
//  ProfileViewController.swift
//  Lesson4
//
//  Created by Эльмира Байгулова on 10.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var editProfileButton: UIButton!
    
    // MARK: -  View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBordersGray(element: editProfileButton)
    }
    
    // Private function
    
    private func makeBordersGray(element: UIView) {
            element.layer.borderWidth = 1
            element.layer.borderColor = UIColor.systemGray4.cgColor
    }
}
