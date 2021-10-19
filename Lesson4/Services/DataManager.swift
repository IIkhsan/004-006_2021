//
//  DataManager.swift
//  Lesson4
//
//  Created by Милана Махсотова on 09.10.2021.
//

import Foundation

class DataManager {
    
    public func getPosts(completion: @escaping (_ data: [Post]) -> Void) {
        sleep(3)
        completion(GeneratePosts.generate())
    }
}
