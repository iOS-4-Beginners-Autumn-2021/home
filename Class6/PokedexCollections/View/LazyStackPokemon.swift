//
//  LazyStackPokemon.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import SwiftUI

struct LazyStackPokemon: View {
	
	@State var pokemonsByColor: [Int: [Pokemon]] = [:]
	@State var selectedId: Int?
	
	var body: some View {
		ScrollView {
			LazyVStack(alignment: .leading, spacing: 0, pinnedViews: .sectionHeaders) {
				ForEach(Array(pokemonsByColor.keys), id: \.self) { color in
					if let pokemons = pokemonsByColor[color] {
						Section(header: HStack {
							Text("Color #\(color.hexString)")
								.font(.title)
								.foregroundColor(.white)
							Spacer()
						}) {
							ForEach(pokemons) { pokemon in
								HStack {
									PokemonImage(pokemonId: pokemon.id) {
										$0.resizable()
											.frame(width: 60, height: 60)
									}.frame(width: 60, height: 60)
									Text(pokemon.name)
									Spacer()
								}
								.padding()
								.onTapGesture { selectedId = pokemon.id }
							}
						}.background(Color(hex: color))
					}
				}
			}
		}
			.navigationTitle("Pokemons Colors")
			.task {
				let pokemons = (try? await getAll()) ?? []
				pokemonsByColor = .init(grouping: pokemons) { $0.color  }
			}
			.sheet(isPresented: isPresented) {
				if let id = selectedId {
					PokemonView(pokemonId: id)
				}
			}
	}
	
	private var isPresented: Binding<Bool> {
		.init(
			get: { selectedId != nil },
			set: { if $0 == false { selectedId = nil} }
		)
	}
}

extension Int {
	var hexString: String {
		String(format: "%2X", self)
	}
}

struct LazyStackPokemon_Previews: PreviewProvider {
	static var previews: some View {
		LazyStackPokemon()
	}
}
