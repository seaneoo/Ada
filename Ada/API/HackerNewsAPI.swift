//
//  HackerNewsAPI.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

enum HackerNewsAPIError: Error {
    case fetching(error: String)
}

class HackerNewsAPI {
    static let shared = HackerNewsAPI()

    private var service = APIService()

    typealias Completion<T> = (Result<T, Error>) -> Void

    func getStories(category: StoriesCategory, completion: @escaping Completion<[Int]>) {
        let url = "https://hacker-news.firebaseio.com/v0/\(category)stories.json"
        service.perform(for: [Int].self, from: url, completion: completion)
    }

    func getItem(id: Int, completion: @escaping Completion<Item>) {
        let url = "https://hacker-news.firebaseio.com/v0/item/\(id).json"
        service.perform(for: Item.self, from: url, completion: completion)
    }

    func getUser(id: String, completion: @escaping Completion<User>) {
        let url = "https://hacker-news.firebaseio.com/v0/user/\(id).json"
        service.perform(for: User.self, from: url, completion: completion)
    }
}

extension HackerNewsAPI {
    enum StoriesCategory {
        case top, best, new
    }
}
