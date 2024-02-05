//
//  ViewController.swift
//  DemoApp
//
//  Created by chaithra.b.d on 05/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postsTableView: UITableView!
    
    private var viewModel = PostsViewModel()
    var posts : [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchPosts()
    }
    
    func fetchPosts() {
        viewModel.fetchPosts { [weak self] posts in
            self?.posts = posts
            print(self?.posts[0].title ?? [])
            self?.postsTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postscell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.text = post.title
        return cell
    }
    
    
}
