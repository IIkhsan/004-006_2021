//
//  Alert.swift
//  Lesson4
//
//  Created by Милана Махсотова on 15.10.2021.
//

import Foundation
import UIKit

extension UIViewController {
    public func showAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
