//
//  PokedexList.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import SwiftUI

struct PokedexList: View {
	
	@State var pokemonsByLetter: [String: [Pokemon]] = [:]
	
	var body: some View {
		List {
			ForEach(Array(pokemonsByLetter.keys.sorted()), id: \.self) { firstLetter in
				if let pokemons = pokemonsByLetter[firstLetter] {
					Section(header: Text(firstLetter)) {
						ForEach(pokemons) { pokemon in
							NavigationLink {
								PokemonView(pokemonId: pokemon.id)
							} label: {
								HStack {
									PokemonImage(pokemonId: pokemon.id) {
										$0.resizable()
											.frame(width: 35, height: 35)
									}
									.frame(width: 35, height: 35)
									Text(pokemon.name)
									Spacer()
								}
							}
						}
					}
				}
			}
		}
//		.listStyle(GroupedListStyle())
		.task {
			let pokemons = (try? await getAll()) ?? []
			pokemonsByLetter = .init(grouping: pokemons) { "\($0.name.first ?? "X")"  }
		}
		.navigationTitle("Pokedex")
	}
}

struct PokedexList_Previews: PreviewProvider {
	static var previews: some View {
		PokedexList()
	}
}
