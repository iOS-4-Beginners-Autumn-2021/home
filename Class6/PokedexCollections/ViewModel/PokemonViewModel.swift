//
//  PokemonViewModel.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import Foundation
import UIKit

@MainActor
class PokemonViewModel: ObservableObject {
	
	private let pokemonFetcher: (Int) async throws -> Pokemon
	private let pokemonCatcher: (Int) async throws -> Pokemon
	private let pokemonImage: (Int) async throws -> Data
	
	init(
		fetcher: @escaping (Int) async throws -> Pokemon = get(id:),
		catcher: @escaping (Int) async throws -> Pokemon = performCatch(id:),
		image: @escaping (Int) async throws -> Data = image(id:)
	) {
		self.pokemonFetcher = fetcher
		self.pokemonCatcher = catcher
		self.pokemonImage = image
	}
	
	@Published var pokemonPhoto: UIImage?
	@Published var pokemonName: String = "Loading"
	@Published var pokemonColor: Int = 0
	@Published var errorMessage: String? { didSet { isShowingError = errorMessage != nil } }
	@Published var isShowingError: Bool = false
	
	@Published var isLoading = false

	func catchPokemon(id: Int) {
		Task {
			isLoading = true
			do {
				let pokemon = try await pokemonCatcher(id)
				let image = try await pokemonImage(id)
				pokemonName = pokemon.name
				pokemonColor = pokemon.color
				pokemonPhoto = UIImage(data: image)
			} catch let error {
				errorMessage = error.localizedDescription
			}
			isLoading = false
		}
	}
	
	func getPokemon(id: Int) {
		Task {
			isLoading = true
			do {
				async let pokemonFetch = try pokemonFetcher(id)
				async let imageFetch = try pokemonImage(id)
				let (newPokemon, image) = try await (pokemonFetch, imageFetch)
				pokemonName = newPokemon.name
				pokemonColor = newPokemon.color
				pokemonPhoto = UIImage(data: image)
				isLoading = false
			} catch let error {
				errorMessage = error.localizedDescription
			}
			isLoading = false
		}
	}
}
