//
//  Alert.swift
//  Lesson4
//
//  Created by Руслан on 11.10.2021.
//

import UIKit

extension UIViewController {
    
    func showOkAlert(title: String?, description: String?) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
}
