//
//  UserView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/18/23.
//

import SwiftUI

struct UserView: View {
    var id: String

    @StateObject private var vm = UserViewModel()

    var body: some View {
        VStack {
            userView
        }
        .navigationTitle(id)
        .task {
            vm.fetchUser(id: id)
        }
    }

    @ViewBuilder
    var userView: some View {
        if let user = vm.user {
            List {
                Label("\(user.karma)", systemImage: "arrow.up")

                Label("\(Date().fromUnix(from: user.created).format(showTime: false))", systemImage: "calendar")

                NavigationLink {
                    Text("Coming soon! 😀")
                } label: {
                    Label("Submissions", systemImage: "book")
                }
            }
            .listStyle(.plain)
        } else {
            ProgressView()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(id: "pg")
    }
}
