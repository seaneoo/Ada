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

    func getStories() async throws -> [Int] {
        do {
            let data = try await service.perform(for: [Int].self, from: "https://hacker-news.firebaseio.com/v0/topstories.json")
            return Array(data.prefix(20)) // TODO: limit the number of IDs to load while developing
        } catch {
            throw HackerNewsAPIError.fetching(error: error.localizedDescription)
        }
    }

    func getItem(from id: Int) async throws -> Item {
        do {
            let data = try await service.perform(for: Item.self, from: "https://hacker-news.firebaseio.com/v0/item/\(id).json")
            return data
        } catch {
            throw HackerNewsAPIError.fetching(error: error.localizedDescription)
        }
    }

    func getUser(from id: String) async throws -> User {
        do {
            let data = try await service.perform(for: User.self, from: "https://hacker-news.firebaseio.com/v0/user/\(id).json")
            return data
        } catch {
            throw HackerNewsAPIError.fetching(error: error.localizedDescription)
        }
    }
}
