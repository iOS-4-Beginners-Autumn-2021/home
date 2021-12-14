//
//  ContentView.swift
//  PokedexCollections
//
//  Created by Rafał Kwiatkowski on 13/12/2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
			TabView {
				NavigationView {
					PokemonGrid()
				}
				.tabItem {
					Image(systemName: "square.grid.3x2")
					Text("Grid")
				}
				NavigationView {
					PokedexList()
				}
				.tabItem {
					Image(systemName: "list.bullet")
					Text("List")
				}
				NavigationView {
					LazyStackPokemon()
				}
				.tabItem {
					Image(systemName: "square.stack.3d.up")
					Text("LazyVStack")
				}
			}.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
