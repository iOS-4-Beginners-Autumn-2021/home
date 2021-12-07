//
//  DirectCallsView.swift
//  Jokes
//
//  Created by Rafał Kwiatkowski on 05/12/2021.
//

import SwiftUI

struct DirectCallsView: View {
	
	let fetcher = JokeFetcherImpl()
	
	@State var joke: String?
	
	var body: some View {
		Text(joke ?? "No jokes")
			.padding()
			.task {
				joke = try? await fetcher.joke().joke
			}
			.onTapGesture {
				Task {
					joke = try? await fetcher.joke().joke
				}
			}
	}
}

struct DirectCallsView_Previews: PreviewProvider {
	static var previews: some View {
		DirectCallsView()
	}
}
