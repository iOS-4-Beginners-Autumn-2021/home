//
//  PokemonView.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import SwiftUI

struct PokemonView: View {
	
	let pokemonId: Int
	@StateObject var viewModel = PokemonViewModel()
	
	var body: some View {
		ZStack {
			Color(hex: viewModel.pokemonColor).ignoresSafeArea()
			VStack(spacing: 40) {
				Text(pokemonId.formatted(.number))
					.font(.largeTitle)
					.foregroundColor(.white)
				if let image = viewModel.pokemonPhoto {
					Image(uiImage: image)
						.scaledToFit()
						.frame(width: 200)
				}
				Text(viewModel.pokemonName)
					.font(.title)
					.foregroundColor(.white)
			}.overlay {
				if viewModel.isLoading {
					ProgressView()
				}
			}
		}
		.alert(viewModel.errorMessage ?? "", isPresented: $viewModel.isShowingError, actions: {})
		.gesture(swipe.onEnded { value in
			if value.translation.height < -40 {
				viewModel.catchPokemon(id: pokemonId)
			}
		})
		.onAppear {
			viewModel.getPokemon(id: pokemonId)
		}
		.disabled(viewModel.isLoading)
	}
	
	private let swipe = DragGesture(minimumDistance: 20, coordinateSpace: .global)
}

struct PokemonView_Previews: PreviewProvider {
	static var previews: some View {
		PokemonView(pokemonId: 1)
	}
}
