//
//  NewsFieldDetailViewController.swift
//  4-6_Lessons
//
//  Created by Renat Murtazin on 11.10.2021.
//

import UIKit

class NewsFieldDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Initialization
    
    let newsFieldPosts: [NewsFieldPost] = [NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image1"), newsFieldPostText: "UTOPIA"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image2"), newsFieldPostText: "CACTUS JACK FOR CR MEN"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image3"), newsFieldPostText: nil), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image4"), newsFieldPostText: "Home office"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image5"), newsFieldPostText: "Life is a movie. So is this album @cactusjack and @a24 set out to bring amazing content for the future. Thru film and media. Startig with this."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image6"), newsFieldPostText: nil), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: UIImage(named: "image7"), newsFieldPostText: "Everything is everything"), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis nunc vulputate, cursus ante ut, ultricies mi. Duis sed dui a neque tempor interdum in at arcu. Phasellus hendrerit accumsan consequat. Donec placerat tortor eu ligula elementum maximus. Aenean gravida commodo turpis et posuere. In dapibus enim augue, at suscipit turpis eleifend quis. Morbi sagittis ante sed commodo imperdiet."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: nil, newsFieldPostText: "Nulla facilisi. Cras sodales fermentum nulla, ac tristique felis pharetra sed. Nunc iaculis tortor vel turpis condimentum, quis dignissim ligula dapibus. Pellentesque a ultrices turpis. Donec blandit at nisl ac semper. Cras nec fermentum eros. Integer viverra felis quis mauris efficitur placerat. Integer velit enim, efficitur at consectetur vel, maximus eu lorem. Mauris fermentum non enim id hendrerit."), NewsFieldPost(newsFieldProfileImage: UIImage(named: "profileImage"), newsFieldProfileName: "travisscott", newsFieldPostImage: nil, newsFieldPostText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris faucibus, quam et molestie facilisis, purus turpis viverra ante, euismod porttitor mi metus eu ligula. Donec fringilla eget ex at tincidunt. Curabitur velit dolor, tempus ac quam pulvinar, aliquet commodo sapien. Nunc eget laoreet ante. Nulla efficitur, nunc sed aliquet euismod, nibh lacus mollis lacus, eget hendrerit sapien tortor ut turpis. Sed eget nibh in nisl dapibus ornare. In eu interdum magna. Proin congue interdum enim, a suscipit tortor venenatis in. In dolor justo, venenatis sit amet dolor ut, condimentum lobortis libero. Donec enim enim, luctus in lectus in, malesuada eleifend mauris.")]
    
    // Outlets
    
    @IBOutlet weak var newsFieldDetailTableView: UITableView!
    
    // Initialization
    
    var newsFieldDetailPost: NewsFieldPost?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialization delegate and data source
        
        newsFieldDetailTableView.delegate = self
        newsFieldDetailTableView.dataSource = self
        
        // Register XIB func
        
        newsFieldDetailTableView.register(UINib(nibName: "NewsFieldDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "newsFieldDetailTableViewCellReuseIdentifier")
        
        // Properties
        
        newsFieldDetailTableView.estimatedRowHeight = 200
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentModel = newsFieldDetailPost else { return UITableViewCell() }
        
        // DequeueReusableCell call
        
        guard let currentCell = tableView.dequeueReusableCell(withIdentifier: "newsFieldDetailTableViewCellReuseIdentifier", for: indexPath) as? NewsFieldDetailTableViewCell
        else { return UITableViewCell() }
        
        currentCell.configureNewsFieldTableViewCell(with: currentModel)
        
        return currentCell
    }
}
