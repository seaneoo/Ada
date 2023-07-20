//
//  UserViewModel.swift
//  Ada
//
//  Created by Sean O'Connor on 7/18/23.
//

import Foundation

@MainActor class UserViewModel: ObservableObject {
    @Published public var user: User?
    @Published public var error: Error?

    func fetchUser(id: String) {
        HackerNewsAPI.shared.getUser(from: id) { [weak self] result in
            switch result {
            case let .success(user):
                DispatchQueue.main.async {
                    self?.user = user
                    self?.error = nil
                }
            case let .failure(error):
                DispatchQueue.main.async {
                    self?.user = nil
                    self?.error = error
                }
            }
        }
    }
}
