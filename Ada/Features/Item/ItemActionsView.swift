//
//  ItemActionsView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/17/23.
//

import SwiftUI

struct ItemActionsView: View {
    var item: Item?

    var body: some View {
        HStack(spacing: 20) {
            if let item = item {
                if let score = item.score {
                    HStack {
                        Image(systemName: "arrow.up")
                        Text(score.formatShort())
                    }
                }

                if let descendants = item.descendants {
                    HStack {
                        Image(systemName: "bubble.left")
                        Text(descendants.formatShort())
                    }
                }

                if let time = item.time {
                    HStack {
                        Image(systemName: "clock")
                        Text("\(Date().fromUnix(from: time).getRelativeTime(from: Date()))")
                    }
                }
            }
        }
    }
}

struct ItemActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionsView(item: Item.Preview)
    }
}
