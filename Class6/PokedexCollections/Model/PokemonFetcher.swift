//
//  PokemonFetcher.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import Foundation
import UIKit

protocol PokemonFetcher {
	func get(id: Int) async throws -> Pokemon
	func image(id: Int) async throws -> Data
	func thumbnail(id: Int) async throws -> Data
	func performCatch(id: Int) async throws -> Pokemon
	func getAll() async throws -> [Pokemon]
}

enum NetworkError: Error {
	case invalidURL
	case missingUUID
	case invalidData
}

private let session = URLSession.shared
private let baseURL = "https://switter.app.daftmobile.com/api/pokemon/"

func get(id: Int) async throws -> Pokemon {
	let request = try await prepareRequest(urlString: "\(baseURL)\(id)")
	let pokemon: Pokemon = try await performRequest(request: request)
	return pokemon
}

func image(id: Int) async throws -> Data {
	let request = try await prepareRequest(urlString: "\(baseURL)\(id)/image")
	let (data, _) = try await session.data(for: request)
	return data
}

func thumbnail(id: Int) async throws -> Data {
	let request = try await prepareRequest(urlString: "\(baseURL)\(id)/thumbnail")
	let (data, _) = try await session.data(for: request)
	return data
}

func performCatch(id: Int) async throws -> Pokemon {
	let request = try await prepareRequest(urlString: "\(baseURL)\(id)/catch", method: "POST")
	let pokemon: Pokemon = try await performRequest(request: request)
	return pokemon
}

func getAll() async throws -> [Pokemon] {
	let request = try await prepareRequest(urlString: "\(baseURL)")
	let pokemons: [Pokemon] = try await performRequest(request: request)
	return pokemons
}

private func performRequest<Response: Codable>(request: URLRequest) async throws -> Response {
	let (data, _) = try await session.data(for: request)
	let response = try JSONDecoder().decode(Response.self, from: data)
	return response
}

private func prepareRequest(urlString: String, method: String = "GET") async throws -> URLRequest {
	guard let url = URL(string: urlString) else { throw NetworkError.invalidURL }
	var request = URLRequest(url: url)
	guard let uuid = await UIDevice.current.identifierForVendor?.uuidString else { throw NetworkError.missingUUID }
	request.addValue(uuid, forHTTPHeaderField: "x-device-uuid")
	request.httpMethod = method
	return request
}
