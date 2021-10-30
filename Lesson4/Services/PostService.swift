import Foundation
import UIKit

class PostService {
    
    // MARK: - Functions
    //initializer
    init() {
            postsWithAll = [post11, post12, post13]
            postsWithImg = [post21, post22, post23]
            postsWithTxt = [post31, post32, post33]
    }
    
    //generator
    func generateNews( completion: @escaping(_ posts: [Post]) -> Void) -> Void {
        sleep(3)
        completion([postsWithAll[Int.random(in: 0...2)],
                    postsWithImg[Int.random(in: 0...2)],
                    postsWithTxt[Int.random(in: 0...2)]])
    }
    
    // MARK: - Private Properties
    private var postsWithAll: [Post]
    private var postsWithImg: [Post]
    private var postsWithTxt: [Post]
    
    private let post11 = Post(authImage: UIImage.init(named: "auth4") ?? UIImage(), authName: "astro geeks", postTime: "12 сент в 16:27", postImage: UIImage.init(named: "Post11"), postText: "Знаки и причина их проблемы в взаимодействии с людьми.")
    private let post12 = Post(authImage: UIImage.init(named: "auth5") ?? UIImage(), authName: "Анатомичка", postTime: "17 сент в 19:30", postImage: UIImage.init(named: "Post12"), postText: "Хорошее заведение и реклама интересная!")
    private let post13 = Post(authImage: UIImage.init(named: "auth5") ?? UIImage(), authName: "Анатомичка", postTime: "23 сент в 15:03", postImage: UIImage.init(named: "Post13"), postText: "Кот-медбрат из приюта для животных помогает сородичам восстанавливаться после операций.")
    
    private let post21 = Post(authImage: UIImage.init(named: "auth2") ?? UIImage(), authName: "Папка с твитами", postTime: "12 окт в 16:27", postImage: UIImage.init(named: "Post21"), postText: nil)
    private let post22 = Post(authImage: UIImage.init(named: "auth1") ?? UIImage(), authName: "Папка с картинками", postTime: "17 окт в 19:30", postImage: UIImage.init(named: "Post22"), postText: nil)
    private let post23 = Post(authImage: UIImage.init(named: "auth2") ?? UIImage(), authName: "Папка с твитами", postTime: "23 окт в 15:03", postImage: UIImage.init(named: "Post23"), postText: nil)
    
    private let post31 = Post(authImage: UIImage.init(named: "auth3") ?? UIImage(), authName: "ЧеширКо", postTime: "12 ноя в 16:27", postImage: nil, postText: "10 июля. \nНачал вести дневник. Последние 150 лет помню, а то что раньше было — забывать стал. Буду записывать, может пригодится. Тетрадку стырил у хозяйки, думаю — не заметит.")
    private let post32 = Post(authImage: UIImage.init(named: "auth3") ?? UIImage(), authName: "ЧеширКо", postTime: "17 ноя в 19:30", postImage: nil, postText: "21 июля. \nДолго не писал, после уборки хозяйкой, три дня искал дневник. Ничего интересного. Приходил к ней какой то мужик с цветами, оставался ночевать. Попросил кота нассать ему в ботинки. Тот долго отнекивался, но я пообещал ему достать игрушку из под дивана. Согласился. Опять получил люлей. Говорит, что я — говно.")
    private let post33 = Post(authImage: UIImage.init(named: "auth3") ?? UIImage(), authName: "ЧеширКо", postTime: "23 ноя в 15:03", postImage: nil, postText: "30 июля. \nНатыкала по всей квартире иконок. Походил, посмотрел… Раньше лучше рисовали…")
    
}
