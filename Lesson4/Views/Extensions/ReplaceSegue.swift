//
//  ReplaceSegue.swift
//  Lesson4
//
//  Created by Evans Owamoyo on 13.10.2021.
//

import UIKit

class ReplaceSegue: UIStoryboardSegue {
    
    override func perform() {
        source.navigationController?.setViewControllers(
            [destination],
            animated: true)
    }
}
