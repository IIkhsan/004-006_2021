//
//  ProfileModel.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 13.10.2021.
//

import Foundation

class ProfileModel {
    
    //MARK: - Properties
    var user: User?
    var dataService = DataService()
    weak var delegate: FeedModelDelegate?
    
    //MARK: - Public functions
    init(delegate: FeedModelDelegate) {
        self.delegate = delegate
    }
    
    func requireData() {
        dataService.requireUser(completion: { user in
            self.user = user
            self.delegate?.dataUpdated()
        })
    }
}
