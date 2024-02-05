//
//  APIService.swift
//  DemoApp
//
//  Created by chaithra.b.d on 05/02/24.
//

import Foundation
class APIService {
    func fetchPosts(completion: @escaping ([Post]?) -> Void) {
        let postUrlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: postUrlString) else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let posts = try JSONDecoder().decode([Post].self, from: data)
                completion(posts)
            } catch {
                print("Error decoding JSON")
                completion(nil)
            }
        }.resume()
    }
}
