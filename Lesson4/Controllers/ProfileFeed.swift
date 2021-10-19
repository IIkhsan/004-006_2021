//
//  ProfileFeed.swift
//  Lesson4
//
//  Created by Tagir Kabirov on 17.10.2021.
//

import UIKit

class ProfileFeed: UIViewController {

    @IBOutlet weak var profileFeed: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileFeed.dataSource = self
        profileFeed.delegate = self
        
        User.addInitialUsers()
    }

}

extension ProfileFeed: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row > 1 else {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: "accountInformation") as! AccountInformationTableViewCell
            }
            else {
                return tableView.dequeueReusableCell(withIdentifier: "friendsList") as! FriendsListTableViewCell
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountInformation") as! AccountInformationTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row > 1 else {
            if indexPath.row == 0 {
                return 250
            }
            else{
                return 150
            }
        }
        return 250
    }
}
