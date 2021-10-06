//
//  FeedViewController.swift
//  Lesson4
//
//  Created by Семен Соколов on 05.10.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    let posts = [
        Post(contentImage: UIImage(named: "1"), profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: "Гри́зли — название одного либо нескольких американских подвидов бурого медведя. Распространён преимущественно на Аляске и в западных районах Канады. Небольшая популяция этих животных сохранилась в континентальной части США в Монтане, в районе Йеллоустона и на северо-западе Вашингтона."),
        Post(contentImage: UIImage(named: "2"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "Коса́тка — вид китообразных из семейства дельфиновых парвотряда зубатых китов. Единственный современный представитель рода косаток. Признан самым крупным представителем своего семейства и единственный среди современных китообразных настоящий хищник, преследующий теплокровных животных."),
        Post(contentImage: UIImage(named: "3"), profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: "Аку́лы — надотряд хрящевых рыб, относящийся к подклассу пластиножаберных и обладающий следующими отличительными особенностями: удлинённое тело более или менее торпедообразной формы, большой гетероцеркальный хвостовой плавник, обычно много острых зубов на каждой челюсти."),
        Post(contentImage: UIImage(named: "4"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "«Наруто» — сёнэн-манга Масаси Кисимото, рассказывающая о жизни шумного и непоседливого ниндзя-подростка Наруто Удзумаки, мечтающего достичь всеобщего признания и стать Хокагэ — главой своего селения и сильнейшим ниндзя."),
        Post(contentImage: UIImage(named: "5"), profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: nil),
        Post(contentImage: UIImage(named: "6"), profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: nil),
        Post(contentImage: UIImage(named: "7"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: nil),
        Post(contentImage: nil, profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: "Эдвард Элрик — центральный персонаж манги и аниме Fullmetal Alchemist, государственный алхимик, майор армии Аместриса. Персонаж создан мангакой Хирому Аракавой, озвучен сэйю Роми Паку. Персонаж занимает 7 строчку в списке 25 лучших персонажей аниме по версии IGN."),
        Post(contentImage: nil, profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "Tesla — американская компания, производитель электромобилей и решений для хранения электрической энергии. Компания была основана в июле 2003 года Мартином Эберхардом и Марком Тарпеннингом, но нынешнее руководство компании называют сооснователями Илона Маска, Джеффри Брайана Страубела и Иэна Райта."),
        Post(contentImage: nil, profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: "Илон Маск — 50-летний американский изобретатель, визионер и миллиардер. На момент полувекового юбилея состояние предпринимателя оценивается в $166 млрд. За прошедший с 49-летия год оно увеличилось практически в четыре раза — в основном, за счет роста биржевых котировок производителя электромобилей Tesla.")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 150
    }
    
}

extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell()}
        cell.makePost(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
