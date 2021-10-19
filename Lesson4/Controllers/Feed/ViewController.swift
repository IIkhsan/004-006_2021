
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = data.posts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: "TextTableViewCell", bundle: nil), forCellReuseIdentifier: "TextTableViewCell")
        self.tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageTableViewCell")
        self.tableView.register(UINib.init(nibName: "TextAndImageTableViewCell", bundle: nil), forCellReuseIdentifier: "TextAndImageTableViewCell")

        configure()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
}

// MARK: - Table view data source & delegate
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextAndImageTableViewCell", for: indexPath) as? TextAndImageTableViewCell  else { return UITableViewCell() }
        cell.configure(post: post)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let post = posts[indexPath.row]
//
//        if (post.content != nil) && (post.contentPicture != nil){
//            return 400
//        }
//        if post.content != nil{
//            return 100
//        }
//        return 300
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let post = posts[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "PostDetailViewController") as! PostDetailViewController
        vc.post = post
        navigationController?.pushViewController(vc, animated: true)
    }
}

