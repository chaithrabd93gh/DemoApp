//
//  PostsViewModel.swift
//  DemoApp
//
//  Created by chaithra.b.d on 05/02/24.
//

import Foundation

class PostsViewModel: ObservableObject {
    var posts: [Post] = []
    private let apiService: APIService
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        apiService.fetchPosts { posts in
            DispatchQueue.main.async {
                completion(posts ?? [])
            }
        }
    }
}
