//
//  ContentView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            StoriesView()
                .tabItem {
                    Label("Stories", systemImage: "newspaper")
                }

            Text("Search")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }

            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }

            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
