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
        VStack(alignment: .leading, spacing: 10) {
            if let item = vm.item {
                if let url = URL(string: item.url ?? "") {
                    HStack {
                        Rectangle().frame(width: 15, height: 15)
                            .foregroundColor(.gray)

                        Text(url.host() ?? "error_no_host")
                            .font(.footnote)
                    }
                }

                if let title = item.title {
                    Text(title)
                        .font(.headline)
                }

                if let by = item.by {
                    HStack {
                        Image(systemName: "person.circle")
                        Text(by)
                    }
                }

                ItemActionsView(item: item)
            } else {
                ProgressView()
            }
        }.task {
            vm.fetchItem(id: id)
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(id: 36245435)
    }
}
