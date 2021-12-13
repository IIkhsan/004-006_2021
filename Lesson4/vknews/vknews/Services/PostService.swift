//
//  PostService.swift
//  vknews
//
//  Created by itisioslab on 06.12.2021.
//

import UIKit

final class PostService {
    
    // MARK: - Properties
    var Info: [SinglePostCellData] = []
    var Data: [SinglePostCellData] = [SinglePostCellData(groupName: "на дальней станции сойду",
                                                         description: "железная дорога через озеро в алтайском крае.",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7613"),
                                                         publishingTime: "23 мая в 9:57 АМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7612"), #imageLiteral(resourceName: "IMG_7696")]),
                                      SinglePostCellData(groupName: "GOLD KARDASHIANS",
                                                         description: "Лана, ловящая трусики фанаток, как отдельный вид искусства",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7621"),
                                                         publishingTime: "28 апр в 10:25 АМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7620"), #imageLiteral(resourceName: "IMG_7619")]),
                                      SinglePostCellData(groupName: "insanity gallery",
                                                         description: nil,
                                                         groupImage: #imageLiteral(resourceName: "IMG_7611"),
                                                         publishingTime: "24 сен в 12:22 РМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7609"), #imageLiteral(resourceName: "IMG_7606")]),
                                      SinglePostCellData(groupName: "GIRL MEMES",
                                                         description: nil,
                                                         groupImage: #imageLiteral(resourceName: "IMG_7615"),
                                                         publishingTime: "27 ноя в 7:35 РМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "w9f0sFXyoRs")]),
                                      SinglePostCellData(groupName: "ART casket",
                                                         description: "Я почти продал душу, но сделал это...",
                                                         groupImage: #imageLiteral(resourceName: "IMG_7618"),
                                                         publishingTime: "1 мая в 10:30 АМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7616"), #imageLiteral(resourceName: "IMG_7617")]),
                                      SinglePostCellData(groupName: "「 аниме хэды 」", description: "「 #imagine #headcanon #genshinimpact #aratakiitto」;; немного об отношениях с ним ✰ аратаки итто (боже если у него буквально рост выше чем у остальных персонажей у меня отвалится жопа...) → несмотря на сложившиеся неоднозначные мнения о нем, как о личности, он та еще милашка по отношению к тебе. каждая просьба, о которой ты просишь, выполняется в мгновение ока, и каждый зов его имени заставляет его тут же оказаться рядом с тобой, готовым помочь. → независимо от твоего роста, он будет выше СТО ПРОЦЕНТОВ. он определенно тот, кто специально кладет нужные тебе ингредиенты на более высокую полку, но также позволит тебе использовать его в качестве табуретки. — Итто, дорогой, для такого у нас есть маленькая деревянная табуретка... — я куда крепче, чем она! → кое-что о его улыбке — всякий раз, когда его взгляд останавливается на тебе, на его щеках появляется огромная ухмылка, похожая на солнце, что смогло перебороть силу природы и взошло над облаками. → говоря об улыбках, у него есть клыки (вот тут я померла), и тебе не избежать неприятностей, которые они приносят. он часто кусает тебя до такой степени, что твоя шея покрывается отметинами. и порой это несет не совсем сексуальный контекст, ведь он не может это контролировать. нельзя просто уйти из дома, слабенько чмокнув тебя, нужно приложить больше силы- → очень нежный возлюбленный! любит-восхваляет-просто-обожает физический контакт, поэтому всегда старается касаться тебя в той или иной степени. обниматься в постели? да. обнимать тебя со спины, пока ты готовишь? да. носить тебя на плече после того, как вы соберете ягоды и овощи в вашем маленьком огороде? да!  → конкуренция присутствует и в ваших отношениях. надеюсь, что у тебя имеется море энергии, потому что он будет ее истощать. кто подарит большее количество поцелуев? кто может приготовить лучшую еду? он совсем не будет поддаваться в такие моменты, но и ты тоже! (хитрость: ты — одна его сплошная слабость, заставить его отвлечься можно в любой момент.) → ваши будущие дети будут чертовски избалованными. и даже не в материальном плане, а в том, что остальные люди должны будут уделять им столько же времени, сколько и вы.  → Аратаки Итто может быть ёкаем, которого все вокруг считают властным божеством, но ничто не стоит на первом месте перед его семьей и супругой. ",
                                                         groupImage: #imageLiteral(resourceName: "UQPtPgB3U0k"), publishingTime: "11 окт в 8:43 РМ", pinnedPics:[]),
                                      SinglePostCellData(groupName: "GIRL MEMES",
                                                         description: nil,
                                                         groupImage: #imageLiteral(resourceName: "IMG_7615"),
                                                         publishingTime:"15 мая в 3:55 РМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "IMG_7614")]),
                                      SinglePostCellData(groupName: "COF",
                                                         description: "Если отношения, то только такие:",
                                                         groupImage: #imageLiteral(resourceName: "SBFGJENUTCQ"),
                                                         publishingTime: "14 ноя в 10:42 РМ",
                                                         pinnedPics: [#imageLiteral(resourceName: "1NIgLhScRfk"), #imageLiteral(resourceName: "A8KnR4UfRJo")]),
                                      SinglePostCellData(groupName: "Щедевры поэзии | стихи", description: "...у всех его новых знакомых, несмотря на разницу лет и характеров, было одно общее, делавшее их похожими друг на друга: все они были люди с прекрасным прошлым и с очень нехорошим настоящим; о своем прошлом они говорили с восторгом, к настоящему же относились почти с презрением. Русский человек любит вспоминать, но не любит жить. Антон Чехов: Степь. История одной поездки",
                                                         groupImage: #imageLiteral(resourceName: "0IEf2FjkGQ4"), publishingTime: "сегодня в 4:07 АМ", pinnedPics:[])
                                    ]

    // MARK: - Public function
    func getNews(completion : @escaping (_ data: [SinglePostCellData]) -> Void) {
        Info = newsMixer()
        sleep(3)
        completion(Info)
    }
    
    // MARK: - Private function
    private func newsMixer() -> [SinglePostCellData] {
        var dataCopy = Data
        for i in stride(from: dataCopy.count - 1, through: 2, by: -1){
            let j = Int.random(in: 0...i+1)
            
            if j < 9 {
                let helper = dataCopy[j]
                dataCopy[j] = dataCopy[i]
                dataCopy[i] = helper
            }
        }
        return dataCopy
    }
}




