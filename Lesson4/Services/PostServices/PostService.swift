//
//  PostService.swift
//  Lesson4
//
//  Created by Artem Kalugin on 11.10.2021.
//

import Foundation

final class PostService {
    func getData(completion: @escaping (([Post]) -> Void)) {
        sleep(3)
        completion([createPost(), createPost(), createPost(), createPost(),createPost(), createPost(), createPost(), createPost(), createPost(), createPost()])
    }
}
