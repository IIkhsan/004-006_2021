//
//  FeedService.swift
//  Lesson4
//
//  Created by Семен Соколов on 14.10.2021.
//

import UIKit

class FeedService {
    //MARK: - Func to generate posts
    func getData(completion: @escaping(([Post]) -> Void)) {
        sleep(3)
        completion([
            .init(contentImage: UIImage(named: "1"), profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: "Гри́зли — название одного либо нескольких американских подвидов бурого медведя. Распространён преимущественно на Аляске и в западных районах Канады. Небольшая популяция этих животных сохранилась в континентальной части США в Монтане, в районе Йеллоустона и на северо-западе Вашингтона."),
            .init(contentImage: UIImage(named: "2"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "Коса́тка — вид китообразных из семейства дельфиновых парвотряда зубатых китов. Единственный современный представитель рода косаток. Признан самым крупным представителем своего семейства и единственный среди современных китообразных настоящий хищник, преследующий теплокровных животных."),
            .init(contentImage: UIImage(named: "3"), profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: "Аку́лы — надотряд хрящевых рыб, относящийся к подклассу пластиножаберных и обладающий следующими отличительными особенностями: удлинённое тело более или менее торпедообразной формы, большой гетероцеркальный хвостовой плавник, обычно много острых зубов на каждой челюсти."),
            .init(contentImage: UIImage(named: "4"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "«Наруто» — сёнэн-манга Масаси Кисимото, рассказывающая о жизни шумного и непоседливого ниндзя-подростка Наруто Удзумаки, мечтающего достичь всеобщего признания и стать Хокагэ — главой своего селения и сильнейшим ниндзя."),
            .init(contentImage: UIImage(named: "5"), profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: nil),
            .init(contentImage: UIImage(named: "6"), profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: nil),
            .init(contentImage: UIImage(named: "7"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: nil),
            .init(contentImage: nil, profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: "Эдвард Элрик — центральный персонаж манги и аниме Fullmetal Alchemist, государственный алхимик, майор армии Аместриса. Персонаж создан мангакой Хирому Аракавой, озвучен сэйю Роми Паку. Персонаж занимает 7 строчку в списке 25 лучших персонажей аниме по версии IGN."),
            .init(contentImage: nil, profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "Tesla — американская компания, производитель электромобилей и решений для хранения электрической энергии. Компания была основана в июле 2003 года Мартином Эберхардом и Марком Тарпеннингом, но нынешнее руководство компании называют сооснователями Илона Маска, Джеффри Брайана Страубела и Иэна Райта."),
            .init(contentImage: nil, profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: "Илон Маск — 50-летний американский изобретатель, визионер и миллиардер. На момент полувекового юбилея состояние предпринимателя оценивается в $166 млрд. За прошедший с 49-летия год оно увеличилось практически в четыре раза — в основном, за счет роста биржевых котировок производителя электромобилей Tesla.")])
    }
}
