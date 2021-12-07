//
//  JokeViewModel.swift
//  Jokes
//
//  Created by Rafał Kwiatkowski on 04/12/2021.
//

import Foundation
import SwiftUI

@MainActor
class JokeViewModel: ObservableObject {
		
	@Published var joke: String = "Prepare for next joke 😏"
	@Published var errorMessage: String? { didSet { isShowingError = errorMessage != nil } }
	@Published var isLoading: Bool = false
	@Published var isShowingError: Bool = false
	
	private let fetcher: JokeFetcher
	private var task: Task<(), Never>?
	
	init(fetcher: JokeFetcher) {
		self.fetcher = fetcher
	}
	
	func nextJokeTapped() {
		task = Task {
//			print("Start loading")
			do {
				isLoading = true
				await Task.sleep(1*1_000_000_000)
				let newJoke = try await fetcher.joke().joke
				withAnimation {
					self.joke = newJoke
				}
			} catch let error {
				self.errorMessage = error.localizedDescription
			}
//			if Task.isCancelled {
//				print("Cancellation can't stop me 😈")
//			}
//			print("About to stop loading")
			isLoading = false
		}
	}
	
	func cancelLoadingTapped() {
		task?.cancel()
	}

}
