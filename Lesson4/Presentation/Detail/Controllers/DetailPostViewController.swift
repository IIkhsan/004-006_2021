//
//  DetailPostViewController.swift
//  Lesson3
//
//  Created by Ильдар Арсламбеков on 24.09.2021.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    //MARK: - Model
    var detailModel: DetailModel = DetailModel()
    
    //MARK: - IBOutlets
    @IBOutlet var detailView: DetailView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.configure(post: detailModel.post)
    }
    
    //MARK: - Functions
    public func configure(post: Post) {
        detailModel.post = post
    }
}
