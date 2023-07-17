//
//  User.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String // the user's unique username
    var created: Int // the creation date and time of the user, in Unix time
    var karma: Int // the user's karma
    var about: String? // the user's optional description (HTML)
    var submitted: [Int]? // the user's stories, polls, and comments
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    static let Preview = User(id: "pg", created: 1160418092, karma: 157044, about: "Bug fixer.", submitted: [35172415, 34043420, 34042993, 22654365, 22654342, 21505741, 21256727])
}
