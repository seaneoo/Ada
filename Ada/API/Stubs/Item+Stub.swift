//
//  Item+Stub.swift
//  Ada
//
//  Created by Sean O'Connor on 7/20/23.
//

import Foundation

extension Item {
    static func storyStub() -> Self {
        Item(id: 3078128, type: ItemType.story, by: "patricktomas", time: 1317858143, kids: [3078211, 3078267, 3078328, 3078198, 3078256, 3078213, 3078317, 3078505, 3078241, 3078372, 3078357, 3078238, 3078300, 3078246, 3078203], url: "http://www.apple.com/stevejobs/", score: 4338, title: "Steve Jobs has passed away.", descendants: 363)
    }

    static func commentStub() -> Self {
        Item(id: 3078211, type: ItemType.comment, by: "donohoe", time: 1317859028, text: "Remembering that I'll be dead soon is the most important tool I've ever encountered to help me make the big choices in life. Because almost everything — all external expectations, all pride, all fear of embarrassment or failure - these things just fall away in the face of death, leaving only what is truly important. Remembering that you are going to die is the best way I know to avoid the trap of thinking you have something to lose. You are already naked. There is no reason not to follow your heart.\"<p>June 12th 2005 Stanford commencement speech<p>Text: <a href=\"http://news.stanford.edu/news/2005/june15/jobs-061505.html\" rel=\"nofollow\">http://news.stanford.edu/news/2005/june15/jobs-061505.html</a><p>Video: <a href=\"http://www.youtube.com/watch?v=UF8uR6Z6KLc\" rel=\"nofollow\">http://www.youtube.com/watch?v=UF8uR6Z6KLc</a>", parent: 3078128, kids: [3078481, 3078271, 3078665, 3078443, 3078326, 3078307, 3078524, 3078240, 3078661, 3079756, 3079746, 3078365])
    }
}
