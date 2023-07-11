//
//  StoriesView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import SwiftUI

struct StoriesView: View {
    @StateObject private var vm = StoriesViewModel()
    @State private var title = "Top Stories"

    var body: some View {
        NavigationStack {
            List {
                if let storyIds = vm.storyIds {
                    ForEach(storyIds, id: \.self) { i in
                        Text("\(String(i))")
                    }
                }
            }
            .navigationTitle(title)
            .listStyle(.plain)
        }
        .task {
            await vm.fetchStories()
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
