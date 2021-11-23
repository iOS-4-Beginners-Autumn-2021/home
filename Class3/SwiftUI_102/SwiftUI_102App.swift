//
//  SwiftUI_102App.swift
//  SwiftUI_102
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI

@main
struct SwiftUI_102App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environmentObject(PlaybackProgressModel())
        }
    }
}
