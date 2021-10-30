//
//  FeedService.swift
//  Lesson4
//
//  Created by Семен Соколов on 14.10.2021.
//

import UIKit

class DataManager {
    
    //MARK: - Func to generate users
    func getUsers(completion: @escaping(([User]) -> Void)) {
        sleep(3)
        var users: [User] = []
        let post1 = Post(contentImage: UIImage(named: "1"), profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: "Гри́зли — название одного либо нескольких американских подвидов бурого медведя. Распространён преимущественно на Аляске и в западных районах Канады. Небольшая популяция этих животных сохранилась в континентальной части США в Монтане, в районе Йеллоустона и на северо-западе Вашингтона.")
        let post2 = Post(contentImage: UIImage(named: "2"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "Коса́тка — вид китообразных из семейства дельфиновых парвотряда зубатых китов. Единственный современный представитель рода косаток. Признан самым крупным представителем своего семейства и единственный среди современных китообразных настоящий хищник, преследующий теплокровных животных.")
        let post3 = Post(contentImage: UIImage(named: "3"), profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: "Аку́лы — надотряд хрящевых рыб, относящийся к подклассу пластиножаберных и обладающий следующими отличительными особенностями: удлинённое тело более или менее торпедообразной формы, большой гетероцеркальный хвостовой плавник, обычно много острых зубов на каждой челюсти.")
        let post4 = Post(contentImage: UIImage(named: "4"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "«Наруто» — сёнэн-манга Масаси Кисимото, рассказывающая о жизни шумного и непоседливого ниндзя-подростка Наруто Удзумаки, мечтающего достичь всеобщего признания и стать Хокагэ — главой своего селения и сильнейшим ниндзя.")
        let post5 = Post(contentImage: UIImage(named: "5"), profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: nil)
        let post6 = Post(contentImage: UIImage(named: "6"), profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: nil)
        let post7 = Post(contentImage: UIImage(named: "7"), profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: nil)
        let post8 = Post(contentImage: nil, profileImage: UIImage(named: "11"), profileLabel: "deadInside", info: "Эдвард Элрик — центральный персонаж манги и аниме Fullmetal Alchemist, государственный алхимик, майор армии Аместриса. Персонаж создан мангакой Хирому Аракавой, озвучен сэйю Роми Паку. Персонаж занимает 7 строчку в списке 25 лучших персонажей аниме по версии IGN.")
        let post9 = Post(contentImage: nil, profileImage: UIImage(named: "12"), profileLabel: "swiftDev", info: "Tesla — американская компания, производитель электромобилей и решений для хранения электрической энергии. Компания была основана в июле 2003 года Мартином Эберхардом и Марком Тарпеннингом, но нынешнее руководство компании называют сооснователями Илона Маска, Джеффри Брайана Страубела и Иэна Райта.")
        let post10 = Post(contentImage: nil, profileImage: UIImage(named: "13"), profileLabel: "LilPeep", info: "Илон Маск — 50-летний американский изобретатель, визионер и миллиардер. На момент полувекового юбилея состояние предпринимателя оценивается в $166 млрд. За прошедший с 49-летия год оно увеличилось практически в четыре раза — в основном, за счет роста биржевых котировок производителя электромобилей Tesla.")
        users.append(User(profileImage: UIImage(named: "11"),
                                  nick: "Hinata Uzumaki", status: "Love Naruto Kun",
                                  city: "Konoha", education: "Ninja School",
                                  work: "HouseWife",
                                  martialStatus: "Married",
                                  phoneNumber: "79190287278",
                                  instagram: "HinataChan",
                          email: "hinata@konoha.com",
                                  password: "hinata1",
                                  posts: [post1,post5,post8]))
        users.append(User(profileImage: UIImage(named: "12"),
                                  nick: "Naruto Uzumaki", status: "Love Hinata Chan",
                                  city: "Konoha", education: "Ninja School",
                                  work: "Hokage",
                                  martialStatus: "Married",
                                  phoneNumber: "79190287777",
                                  instagram: "NarutoKun",
                                  email: "naruto@konoha.com",
                                  password: "naruto1",
                                  posts: [post2,post6,post9]))
        users.append(User(profileImage: UIImage(named: "13"),
                                  nick: "Sasuke Uchiha", status: "Love Sakura Chan",
                                  city: "Konoha", education: "Ninja School",
                                  work: "Boruto trainer",
                                  martialStatus: "Married",
                                  phoneNumber: "79190286666",
                                  instagram: "SasukeKun",
                                  email: "sasuke@konoha.com",
                                  password: "sasuke1",
                                  posts: [post3,post4,post7,post10]))
        completion(users)
    }
    
}
