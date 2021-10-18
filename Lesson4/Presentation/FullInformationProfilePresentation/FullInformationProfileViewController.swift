//
//  FullInformationProfileViewController.swift
//  Lesson4
//
//  Created by Даниил Багаутдинов on 13.10.2021.
//

import UIKit

class FullInformationProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        guard let fullInformationProfile = view as? FullInformationProfileView else { return }
        fullInformationProfile.nameLabel.text = profileNow.name
        fullInformationProfile.statusLabel.text = profileNow.status
        fullInformationProfile.cityLabel.text = profileNow.city
        fullInformationProfile.educationLabel.text = profileNow.education
        fullInformationProfile.numberLabel.text = profileNow.number
        fullInformationProfile.workLabel.text = profileNow.work
        fullInformationProfile.maritalLabel.text = profileNow.maritalStatus
        fullInformationProfile.hometownLabel.text = profileNow.hometown
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
