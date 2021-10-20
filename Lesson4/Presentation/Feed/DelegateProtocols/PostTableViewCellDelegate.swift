//
//  PostTableViewCellDelegate.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 15.10.2021.
//

import Foundation
import UIKit

protocol PostTableViewCellDelegate: AnyObject {
    func likeTapped(sender: UITableViewCell)
    func likeCanceled(sender: UITableViewCell)
}
