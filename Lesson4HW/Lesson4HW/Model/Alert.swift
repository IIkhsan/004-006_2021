//
//  Alert.swift
//  Lesson4HW
//
//  Created by Тимур Миргалиев on 15.10.2021.
//

import Foundation
import UIKit

extension UIViewController {
    func createAlert(title: String?, description: String?) {
        let alertController = UIAlertController(
            title: title, message: description, preferredStyle: .alert
        )
        alertController.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        present(alertController, animated: true, completion: nil)
    }
}
