//
//  PostModel.swift
//  DemoApp
//
//  Created by chaithra.b.d on 05/02/24.
//

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
