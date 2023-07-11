//
//  Story.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import Foundation

struct Item: Codable, Identifiable {
    var id: Int // the item's unique id
    var deleted: Bool? // true, if the item is deleted
    var type: ItemType? // the type of the item (job, story, comment, poll, or pollopt)
    var by: String? // the username of the item's author
    var time: Int? // the creation date and time of the item, in Unix time
    var text: String? // the comment, story, or poll text (HTML)
    var dead: Bool? // true, if the item is dead
    var parent: Int? // the comment's parent (an item id)
    var poll: Int? // the pollopt's associated poll
    var kids: [Int]? // the ids of the item's comments
    var url: String? // the url of the story
    var score: Int? // the story's score
    var title: String? // the title of the story, poll, or job (HTML)
    var parts: [Int]? // a list of related pollopts
    var descendants: Int? // the total comment count
}

// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
enum ItemType: String, Codable {
    case job, story, comment, poll, pollopt
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
}
