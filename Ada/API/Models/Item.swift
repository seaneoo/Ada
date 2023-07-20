//
//  Story.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

struct Item: Codable, Identifiable {
    var id: Int
    var deleted: Bool?
    var type: ItemType?
    var by: String?
    var time: Int?
    var text: String?
    var dead: Bool?
    var parent: Int?
    var poll: Int?
    var kids: [Int]?
    var url: String?
    var score: Int?
    var title: String?
    var parts: [Int]?
    var descendants: Int?
}

extension Item {
    enum ItemType: String, Codable {
        case job, story, comment, poll, pollopt
    }
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
}
