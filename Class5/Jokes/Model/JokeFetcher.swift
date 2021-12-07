//
//  JokeFetcher.swift
//  Jokes
//
//  Created by Rafał Kwiatkowski on 04/12/2021.
//

import Foundation

protocol JokeFetcher {
	func joke() async throws -> Joke
}

enum FetcherError: Error {
	case invalidURL
	case invalidData
}

class JokeFetcherImpl: JokeFetcher {
	
	private let urlString = "https://geek-jokes.sameerkumar.website/api?format=json"
	private let session: URLSession
	
	init() {
		self.session = URLSession(configuration: .ephemeral)
	}
	
	func joke() async throws -> Joke {
		guard let url = URL(string: urlString) else { throw FetcherError.invalidURL }
		let (data, _) = try await session.data(from: url)
		guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else { throw FetcherError.invalidData }
		return joke
	}
	
}
