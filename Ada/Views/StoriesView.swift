//
//  StoriesView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import SwiftUI

struct StoriesView: View {
    // TODO: will be used to dynamically change the title (i.e., "Top Stories" or "New Stories")
    @State private var title = "Top Stories"
    // TODO: will be used to filter the stories shown (i.e., matching story titles)
    @State private var search = ""
    // Array of item IDs
    @State private var stories: [Int] = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(stories, id: \.self) { i in
                    Text("\(String(i))")
                }
            }
            .navigationTitle(title)
            .searchable(text: $search)
        }
        .task {
            do {
                stories = try await HackerNewsAPI.shared.getStories()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
