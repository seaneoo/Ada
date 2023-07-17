//
//  AdaApp.swift
//  Ada
//
//  Created by Sean O'Connor on 7/10/23.
//

import AlertToast
import SwiftUI

@main
struct AdaApp: App {
    @StateObject var state = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
                .toast(isPresenting: $state.isShowingToast) {
                    AlertToast(displayMode: .hud, type: .regular, title: state.toastText)
                }
        }
    }
}
