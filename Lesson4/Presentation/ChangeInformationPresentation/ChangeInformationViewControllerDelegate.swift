//
//  ChangeInformationViewControllerDelegate.swift
//  Lesson4
//
//  Created by Artem Kalugin on 19.10.2021.
//

import Foundation

protocol ChangeInformationViewControllerDelegate: AnyObject {
    func changeUserNow(user: User)
}
