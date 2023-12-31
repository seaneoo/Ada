//
//  StoriesViewModel.swift
//  Ada
//
//  Created by Sean O'Connor on 7/11/23.
//

import Foundation

@MainActor class StoriesViewModel: ObservableObject {
    @Published public var category: HackerNewsAPI.StoriesCategory = .top {
        didSet {
            fetchStories()
        }
    }

    @Published public var stories: [Int]?
    @Published public var error: Error?

    func fetchStories() {
        HackerNewsAPI.shared.getStories(category: category) { [weak self] result in
            switch result {
            case let .success(stories):
                DispatchQueue.main.async {
                    self?.stories = Array(stories.prefix(upTo: 10)) // TODO: Temporary restriction
                    self?.error = nil
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    self?.stories = nil
                    self?.error = error
                }
            }
        }
    }
}
