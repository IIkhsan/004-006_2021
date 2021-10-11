//
//  PostService.swift
//  Lesson4
//
//  Created by Artem Kalugin on 11.10.2021.
//

import Foundation

final class PostService {
    func addToFeed(completion: @escaping (() -> Post)) -> Post {
        sleep(3)
        return completion()
    }
}
