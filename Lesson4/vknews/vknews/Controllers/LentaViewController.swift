//
//  LentaViewController.swift
//  vknews
//
//  Created by itisioslab on 27.09.2021.
//

import UIKit

class LentaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var Info: [SinglePostCellData] = [SinglePostCellData(groupName: "на дальней станции сойду",
                                                         description: "железная дорога через озеро в алтайском крае.",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7613"),
                                                         publishingTime: "23 мая в 9:57 АМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7612"), #imageLiteral(resourceName: "IMG_7696")]),
                                      SinglePostCellData(groupName: "GOLD KARDASHIANS",
                                                         description: "Лана, ловящая трусики фанаток, как отдельный вид искусства",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7621"),
                                                         publishingTime: "28 апр в 10:25 АМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7620"), #imageLiteral(resourceName: "IMG_7619")]),
                                      SinglePostCellData(groupName: "ART casket",
                                                         description: "Я почти продал душу, но сделал это...",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7618"),
                                                         publishingTime: "1 мая в 10:30 АМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7616"), #imageLiteral(resourceName: "IMG_7617")]),
                                      SinglePostCellData(groupName: "GIRL MEMES",
                                                         description: "",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7615"),
                                                         publishingTime:"15 мая в 3:55 РМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7614")]),
                                      SinglePostCellData(groupName: "Щедевры поэзии | стихи", description: "...у всех его новых знакомых, несмотря на разницу лет и характеров, было одно общее, делавшее их похожими друг на друга: все они были люди с прекрасным прошлым и с очень нехорошим настоящим; о своем прошлом они говорили с восторгом, к настоящему же относились почти с презрением. Русский человек любит вспоминать, но не любит жить. Антон Чехов: Степь. История одной поездки",
                                                         groupImage: #imageLiteral(resourceName: "0IEf2FjkGQ4"), publishingTime: "сегодня в 4:07 АМ", pinnedPics:[])]
    
   override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
   }
}

extension LentaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as? PostTableViewCell else { return UITableViewCell() }
        cell.SetData(post: Info[indexPath.row])
        return cell
    }
}
    
extension LentaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailedPostViewController = storyboard.instantiateViewController(withIdentifier: "DetailedPostViewController") as? DetailedPostViewController else { return }
        navigationController?.pushViewController(detailedPostViewController, animated: true)
        detailedPostViewController.post = Info[indexPath.row]
    }
}

