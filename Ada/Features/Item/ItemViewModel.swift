//
//  ItemViewModel.swift
//  Ada
//
//  Created by Sean O'Connor on 7/13/23.
//

import Foundation

@MainActor class ItemViewModel: ObservableObject {
    @Published public var item: Item?
    @Published public var error: Error?

    func fetchItem(id: Int) {
        HackerNewsAPI.shared.getItem(from: id) { [weak self] result in
            switch result {
            case let .success(item):
                DispatchQueue.main.async {
                    self?.item = item
                    self?.error = nil
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    self?.item = nil
                    self?.error = error
                }
            }
        }
    }
}
