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
                if let stories = vm.stories {
                    ForEach(stories, id: \.self) { id in
                        ItemView(id: id)
                    }
                }
            }
            .navigationTitle(title)
            .listStyle(.plain)
        }
        .task {
            vm.fetchStories()
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
