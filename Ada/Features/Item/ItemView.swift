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
        VStack(alignment: .leading) {
            if let item = vm.item {
                Text(item.title ?? "nil")
                    .font(.title2)
                Text("by \(item.by ?? "nil")")
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
