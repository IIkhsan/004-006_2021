////
////  TableViewController.swift
////  Lesson3
////
////  Created by i.ikhsanov on 21.09.2021.
////
//
//import UIKit
//
////class TableViewController: UITableViewController {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return students.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        cell.textLabel?.text = students[indexPath.row].author
//        cell.detailTextLabel?.text = students[indexPath.row].content
//        cell.imageView?.image = #imageLitera
//
//        return cell
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
