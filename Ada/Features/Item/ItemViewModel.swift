//
//  ItemViewModel.swift
//  Ada
//
//  Created by Sean O'Connor on 7/13/23.
//

import Foundation

@MainActor class ItemViewModel: ObservableObject {
    @Published public var item: Item?

    func fetchItem(id: Int) async {
        do {
            item = try await HackerNewsAPI.shared.getItem(from: id)
        } catch {
            print(error.localizedDescription)
        }
    }
}
