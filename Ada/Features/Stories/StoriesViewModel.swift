//
//  StoriesViewModel.swift
//  Ada
//
//  Created by Sean O'Connor on 7/11/23.
//

import Foundation

@MainActor class StoriesViewModel: ObservableObject {
    @Published public var storyIds: [Int]?

    func fetchStories() async {
        do {
            storyIds = try await HackerNewsAPI.shared.getStories()
        } catch {
            print(error.localizedDescription)
        }
    }
}
