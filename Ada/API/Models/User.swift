//
//  User.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var created: Int
    var karma: Int
    var about: String?
    var submitted: [Int]?
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
