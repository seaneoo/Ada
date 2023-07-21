//
//  StoriesView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import SwiftUI

struct StoriesView: View {
    @StateObject private var vm = StoriesViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    if let stories = vm.stories {
                        ForEach(stories, id: \.self) { id in
                            VStack(spacing: 0) {
                                ItemView(id: id)

                                if id != stories.last {
                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("\(vm.category.rawValue) stories".capitalized)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        ForEach(HackerNewsAPI.StoriesCategory.allCases, id: \.rawValue) { cat in
                            Button {
                                vm.category = cat
                            } label: {
                                Label(cat.rawValue.capitalized, systemImage: cat.systemImage())
                            }
                        }
                    } label: {
                        Label(vm.category.rawValue.capitalized, systemImage: vm.category.systemImage())
                    }
                }
            }
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
