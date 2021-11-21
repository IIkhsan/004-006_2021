//
//  NewsfeedViewController.swift
//  HW4-6
//
//  Created by Arslan Rashidov on 15.11.2021.
//

import UIKit

class NewsfeedViewController: UIViewController {

    
    // MARK: - UI
    
    @IBOutlet var NewsfeedTableView: UITableView!
    
    
    // MARK: - Properties
    
    var newsPostsData: [newsPost] = []
    
    // MARK: - ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getNewsPostsData()
        
        NewsfeedTableView.delegate = self
        NewsfeedTableView.dataSource = self
    }
    
    // MARK: - Private Methods
    
    func getNewsPostsData() -> Void {
        let a = { [self] () -> () in
            sleep(3)
            newsPostsData = callToServer()
        }
        a()
    }
    
    func callToServer() -> [newsPost] {
        return [.init(text: "1"),
                .init(text: "Mercedes-Benz S400d W223", image: UIImage(named: "PhotoForNewsPosts1")),
                .init(text: """
                            Cмoтpя нa тaкие фoтoгpaфии, я нaчинaю coмневaться в pеaльнocти пpoиcхoдящегo.
                            
                            Kак же кpaсивo 😍
                            """, image: UIImage(named: "PhotoForNewsPosts2")),
                .init(text: """
                   Роскомнадзор грозится заблокировать Youtube целиком, если тот не снимет ограничения с аккаунтов немецкого отдела RT.

                   Youtube заблокировал RT DE за нарушение правил площадки в отношении ложной информации о коронавирусе, после чего владельцы канала загрузили видео на другой канал, но сервис заблокировал и его.
                   """),
                .init(text: """
                   Мы ответственны за тех, кого не послали на в@кцинацию сразу

                   ✹ МИД РФ заявил, что ограничения Франции в отношении людей, привитых российскими препаратами — это «вакцинная дискриминация»;

                   ✹ Минздрав предлагает разрешить ввоз не зарегистрированных в России вакцин для Международного медицинского кластера в Сколково.
                   """),
                .init(text: """
                   Нейросеть подтвердила опасения о неподлинности картины Рубенса из лондонской Национальной галереи.

                   Картина «Самсон и Далила» пропадала в XVII веке и была снова обнаружена лишь в 1929 году. Спустя полвека Национальная галерея приобрела её за 2,5 миллиона фунтов, однако многие отмечали в ней расхождения со стилем Питера Пауля Рубенса.
                   """, image: UIImage(named: "PhotoForNewsPosts3")),
                .init(text: "Dr. Dre снова делится новой фотографией из студии.", image: UIImage(named: "PhotoForNewsPosts4")),
                .init(text: """
                   ❗️ Родительские организации добились отмены концертов Моргенштерна уже в 10 российских городах — СМИ
                   """),
                .init(text: """
                   Ted Lasso | Тед Лассо
                   2021
                   Beard After Hours

                   Создатели сериала пошли настолько далеко со своими экспериментами, за что я их, безусловно, хвалю, и засунули вместо одного эпизода целый фильм о нелегком, но очень забавном и удивительном дне тренера Берда.
                   """, image: UIImage(named: "PhotoForNewsPosts5")),
                .init(text: "Kanye West & Diddy", image: UIImage(named: "PhotoForNewsPosts6")),
                .init(text: """
                   👤 Jay-Z

                   ⌚ Richard Mille RM 56-01 Tourbillon in Green Sapphire

                   💰 Стоимость: $3.000.000
                   """, image: UIImage(named: "PhotoForNewsPosts7"))]
    }
}

// MARK: -UITableViewDataSource, UITableViewDelegate

extension NewsfeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsPostsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsfeedTableView.dequeueReusableCell(withIdentifier: "NewsPostTableViewCell", for: indexPath) as! NewsPostTableViewCell
        
        cell.configure(newsPost: newsPostsData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath.row){
        case(0):
            return 70
        case(1):
            return 400
        case(2):
            return 400
        case(3):
            return 150
        case(4):
            return 150
        case(5):
            return 400
        case(6):
            return 400
        case(7):
            return 150
        case(8):
            return 380
        case(9):
            return 400
        case(10):
            return 400
        default:
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsPost = newsPostsData[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "NewsPostDetailViewController") as! NewsPostDetailViewController
        vc.newsPost = newsPost
        navigationController?.pushViewController(vc, animated: true)
    }
}

struct newsPost {
    var text: String?
    var image: UIImage?
}

