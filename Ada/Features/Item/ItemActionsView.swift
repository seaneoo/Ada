//
//  ItemActionsView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/17/23.
//

import SwiftUI

struct ItemActionsView: View {
    var item: Item?

    @EnvironmentObject var state: AppState

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
                    Button {
                        state.toastText = Date().fromUnix(from: time).format()
                        state.isShowingToast = true
                    } label: {
                        HStack {
                            Image(systemName: "clock")
                            Text("\(Date().fromUnix(from: time).getRelativeTime(from: Date()))")
                        }
                    }
                    .foregroundColor(.primary)
                    .buttonStyle(.plain)
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
