//
//  UserView.swift
//  Ada
//
//  Created by Sean O'Connor on 7/18/23.
//

import SwiftUI

struct UserLabelView: View {
    let id: String

    var body: some View {
        NavigationLink {
            UserView(id: id)
        } label: {
            HStack(spacing: 5) {
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                Text(id)
            }
        }
        .foregroundColor(.primary)
    }
}

struct UserLabelView_Previews: PreviewProvider {
    static var previews: some View {
        UserLabelView(id: "pg")
    }
}
