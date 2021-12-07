//
//  JokesApp.swift
//  Jokes
//
//  Created by Rafał Kwiatkowski on 04/12/2021.
//

import SwiftUI

@main
struct JokesApp: App {
	var body: some Scene {
		WindowGroup {
			JokeView()
				.environmentObject(JokeViewModel(fetcher: JokeFetcherImpl()))
		}
	}
}
