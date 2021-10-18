//
//  NewsController.swift
//  Lesson4
//
//  Created by Alina Bikkinina on 18.10.2021.
//

import UIKit

class NewsController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var posts: [Post] = [Post.init(authImage: UIImage(), authName: "ITIS mentor", postTime: "20 сен в 19:10", postImage: nil, postText: "Привет! На связи команда наставничества 😉 \n3… 2… 1…\nОбъявляем набор через формы закрытым и… \nПриглашаем всех на занятия!!! \nКак попасть на занятия?\n- Найти свою академическую группу в таблице\n- Присоединиться к беседам ВК и к командам MS Teams (ссылка и код напротив ваших предметов)\n * если на месте времени стоит прочерк, то оно обговаривается с тьютором\n\nТаблица со ссылками: https://docs.google.com/spreadsheets/d/11M5uvs27ozMwP..\n\nОбозначения групп: первый символ — буква предмета, второй — номер тьюторской группы\n\n1 курс:\nD - Дискретная математика\nA - Алгебра и геометрия\nM - Математический анализ\nI - Информатика\n\n2 курс:\nI - Информатика\nN - Сети и потоки\nB - Базы данных\nP - Теория вероятностей\n\n=================================================\n\nВашей группы нет в таблице?\nИз вашей группы никто не записался на тьюторства. Если всё же хотите ходить, скоро мы запустим Telegram-бота для записи на занятия👌"),
                         .init(authImage: UIImage(), authName: "SpaceX", postTime: "23:52", postImage: UIImage.init(named: "Test"), postText: nil)]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.dataSource = self
        newsTableView.delegate = self
        newsTableView.rowHeight = UITableView.automaticDimension;
        newsTableView.estimatedRowHeight = 500.0;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension NewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.setData(post: posts[indexPath.row])
        return cell
    }
}

extension NewsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
