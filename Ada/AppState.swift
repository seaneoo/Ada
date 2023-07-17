//
//  AppState.swift
//  Ada
//
//  Created by Sean O'Connor on 7/17/23.
//

import Foundation

class AppState: ObservableObject {
    @Published var isShowingToast = false
    @Published var toastText = ""
}
