//
//  ChangeStatusViewController.swift
//  Lesson4HW
//
//  Created by Тимур Миргалиев on 16.10.2021.
//

import UIKit

protocol ChangerStatusDelegate: AnyObject {
    func changeStatus(with status: String?)
}

class ChangeStatusViewController: UIViewController {
    
    @IBOutlet weak var statusTextField: UITextField!
    @IBOutlet weak var changeStatusButtonNoAction: UIButton!
    
    weak var delegate: ChangerStatusDelegate?
    
    @IBAction func changeStatusButton(_ sender: Any) {
        if statusTextField.text != "" {
            delegate?.changeStatus(with: statusTextField.text)
            navigationController?.popViewController(animated: true)
        } else {
            createAlert(title: "Введите статус", description: "Вы не ввели статус")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeStatusButtonNoAction.layer.cornerRadius = changeStatusButtonNoAction.frame.height / 2
    }
    
}
