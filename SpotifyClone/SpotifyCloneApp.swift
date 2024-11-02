//
//  SpotifyCloneApp.swift
//  SpotifyClone
//
//  Created by abdullah on 31.10.2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct SpotifyCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                HomeView()
            }
        }
    }
}
