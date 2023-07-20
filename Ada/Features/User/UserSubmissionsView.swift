//
//  UserSubmissionsView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/20/23.
//

import SwiftUI

struct UserSubmissionsView: View {
    let user: User

    var body: some View {
        NavigationStack {
            List {
                if let submitted = user.submitted {
                    ForEach(submitted, id: \.self) { id in
                        NavigationLink {
                            Text(String(id))
                        } label: {
                            Text(String(id))
                        }
                    }
                } else {
                    ProgressView()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Submissions")
        }
    }
}

struct UserSubmissionsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSubmissionsView(user: User.Preview)
    }
}
