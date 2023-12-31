//
//  ItemView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/13/23.
//

import SwiftUI

struct ItemView: View {
    var id: Int

    @StateObject private var vm = ItemViewModel()

    var body: some View {
        VStack {
            itemView
        }.task {
            vm.fetchItem(id: id)
        }
    }

    @ViewBuilder
    var itemView: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let item = vm.item {
                if let url = URL(string: item.url ?? "") {
                    HStack {
                        Link(destination: url) {
                            Label(url.host() ?? "error_no_host", systemImage: "link")
                                .font(.footnote)
                                .foregroundColor(.blue)
                        }
                    }
                }

                if let title = item.title {
                    Text(title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                }

                if let by = item.by {
                    UserLabelView(id: by)
                }

                ItemActionsView(item: item)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .trailing], 20)
        .padding([.top, .bottom], 10)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(id: 36245435)
    }
}
