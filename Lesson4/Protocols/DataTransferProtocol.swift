//
//  DataTransferProtocol.swift
//  Lesson4
//
//  Created by Милана Махсотова on 15.10.2021.
//

import Foundation

protocol DataTransferProtocol {
    func didPressReturn(newStatus: String, newHometown: String, newName: String)
}