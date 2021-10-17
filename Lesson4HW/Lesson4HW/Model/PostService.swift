//
//  PostService.swift
//  Lesson4HW
//
//  Created by Тимур Миргалиев on 16.10.2021.
//

import Foundation

let generatorForPost = GeneratorForPosts()

final class PostService {
    func getData(completion: @escaping (([Post]) -> Void)) {
        sleep(3)
        completion([generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate(), generator.generate()])
    }
    
    func getDataPerson(completion: @escaping (([Post]) -> Void)) {
        completion([generator.generateForPersonFirst(), generator.generateForPersonSecond(), generator.generateForPersonThird()])
    }
}
