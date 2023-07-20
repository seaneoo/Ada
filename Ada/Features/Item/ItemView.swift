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
            if let url = URL(string: vm.item?.url ?? "") {
                HStack {
                    Link(destination: url) {
                        Label(url.host() ?? "error_no_host", systemImage: "link")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
            }

            if let title = vm.item?.title {
                Text(title)
                    .font(.headline)
            }

            if let by = vm.item?.by {
                UserLabelView(id: by)
            }

            if vm.item != nil {
                ItemActionsView(item: vm.item)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(id: 36245435)
    }
}
