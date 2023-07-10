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

    var body: some View {
        NavigationStack {
            List {
            }
            .navigationTitle(title)
            .searchable(text: $search)
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView()
    }
}
