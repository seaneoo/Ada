//
//  ItemActionsView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/17/23.
//

import SwiftUI

struct ItemActionsView: View {
    var item: Item

    @EnvironmentObject var state: AppState

    var body: some View {
        HStack {
            actionsLeft
//          TODO: no functionality yet
//            Spacer()
//            actionsRight
        }
    }

    @ViewBuilder
    var actionsLeft: some View {
        HStack(spacing: 15) {
            if let score = item.score {
                Button {
                    state.toastText = "\(score) upvotes"
                    state.isShowingToast = true
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(score.formatShort())
                            .font(.subheadline)
                    }
                }
                .foregroundColor(.primary)
                .buttonStyle(.plain)
            }

            if let descendants = item.descendants {
                Button {
                    state.toastText = "\(descendants) comments"
                    state.isShowingToast = true
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "bubble.left")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text(descendants.formatShort())
                            .font(.subheadline)
                    }
                }
                .foregroundColor(.primary)
                .buttonStyle(.plain)
            }

            if let time = item.time {
                Button {
                    state.toastText = Date.fromUnix(from: time).format()
                    state.isShowingToast = true
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("\(Date.fromUnix(from: time).getRelativeTime(from: Date()))")
                            .font(.subheadline)
                    }
                }
                .foregroundColor(.primary)
                .buttonStyle(.plain)
            }
        }
    }

    @ViewBuilder
    var actionsRight: some View {
        HStack {
            Button {
                print("save")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.green)
                        .opacity(0)

                    Image(systemName: "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
            }

            Button {
                print("upvote")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.orange)
                        .opacity(0)

                    Image(systemName: "arrow.up")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

struct ItemActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ItemActionsView(item: Item.storyStub())
    }
}
