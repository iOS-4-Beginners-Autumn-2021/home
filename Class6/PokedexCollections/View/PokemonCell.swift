//
//  PokemonCell.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import SwiftUI



struct PokemonCell: View {
	let pokemonId: Int
	let name: String
	let color: Int
	
	var body: some View {
		ZStack {
			Color.init(hex: color)
			VStack {
				PokemonImage(pokemonId: pokemonId) {
					$0.resizable().frame(width: 50, height: 50)
				}
				Text(name).lineLimit(1)
			}
			.padding()
		}
	}
}

struct PokemonImage<ImageView: View>: View {
	
	
	@State var image: UIImage?
	let pokemonId: Int
	let onImageFetched: (Image) -> ImageView
	
	var body: some View {
		Group {
			if let image = image {
				onImageFetched(Image(uiImage: image))
			} else {
				ProgressView()
			}
		}
		.task {
			do {
				let data = try await thumbnail(id: pokemonId)
				image = UIImage(data: data)
			} catch let error {
				print(error)
			}
		}
	}
}

//struct PokemonCell_Previews: PreviewProvider {
//	static var previews: some View {
//		PokemonCell()
//	}
//}
