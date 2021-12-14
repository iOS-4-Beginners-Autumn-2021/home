//
//  PokemonGrid.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import SwiftUI

struct PokemonGrid: View {

	let columns: [GridItem] = [
//		.init(.fixed(70), spacing: 0),
//		.init(.adaptive(minimum: 80))
		.init(.flexible(), spacing: 0),
		.init(.flexible(), spacing: 0),
		.init(.flexible(), spacing: 0)
	]
	
	@State var pokemons: [Pokemon] = []
	
	var body: some View {
		ScrollView {
			LazyVGrid(columns: columns, spacing: 0) {
				ForEach(pokemons) { pokemon in
					NavigationLink(
						destination: { PokemonView(pokemonId: pokemon.number) },
						label: {
							PokemonCell(
								pokemonId: pokemon.number,
								name: pokemon.name,
								color: pokemon.color
							)
						}
					)
				}
			}
		}
			.navigationTitle("Pokemons")
			.navigationBarTitleDisplayMode(.large)
			.task {
				pokemons = (try? await getAll()) ?? []
			}
	}
}

extension Pokemon: Identifiable {
	var id: Int { self.number }
}

struct PokemonGrid_Previews: PreviewProvider {
	static var previews: some View {
		PokemonGrid()
	}
}
