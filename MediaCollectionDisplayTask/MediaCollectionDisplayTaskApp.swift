//
//  MediaCollectionDisplayTaskApp.swift
//  MediaCollectionDisplayTask
//
//  Created by apple on 27/04/2021.
//

import SwiftUI

@main
struct MediaCollectionDisplayTaskApp: App {
    @StateObject private var gallery = MediaCollection()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gallery)
        }
    }
}
