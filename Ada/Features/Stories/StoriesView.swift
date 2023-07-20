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
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    if let stories = vm.stories {
                        ForEach(stories, id: \.self) { id in
                            VStack {
                                ItemView(id: id)

                                if id != stories.last {
                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle(title)
        }
        .task {
            vm.fetchStories(category: .top)
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
