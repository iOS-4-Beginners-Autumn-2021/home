//
//  JokeView.swift
//  Jokes
//
//  Created by Rafał Kwiatkowski on 04/12/2021.
//

import SwiftUI

struct JokeView: View {
	@EnvironmentObject var viewModel: JokeViewModel
	
	var body: some View {
		ZStack {
			LinearGradient(colors: [.indigo, .mint], startPoint: .topLeading, endPoint: .bottomTrailing)
				.ignoresSafeArea()
			VStack {
				Text("The Jokes")
					.font(.largeTitle)
					.foregroundColor(.white)
					.italic()
					.bold()
					.padding(.top, 48)
				Spacer()
				Text(viewModel.joke)
					.font(.title)
					.foregroundColor(.white)
					.multilineTextAlignment(.center)
					.padding()
					.background(.ultraThinMaterial)
					.mask(RoundedRectangle(cornerRadius: 12))
					.padding(.horizontal, 24)
					.transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .trailing)))
					.id("Text" + "\(viewModel.joke)")
					.zIndex(1)
				Spacer()
			}
		}
		.alert(viewModel.errorMessage ?? "", isPresented: $viewModel.isShowingError, actions: {})
		.safeAreaInset(edge: .bottom) {
			Button(viewModel.isLoading ? "Cancel" : "Next joke!") {
				viewModel.isLoading ? viewModel.cancelLoadingTapped() : viewModel.nextJokeTapped()
			}
			Button(action: { viewModel.isLoading ? viewModel.cancelLoadingTapped() : viewModel.nextJokeTapped() }) {
				Text(viewModel.isLoading ? "Cancel" : "Next joke!")
					.foregroundColor(.white)
					.frame(width: 200, height: 40)
			}
			.tint(viewModel.isLoading ? .red : .blue)
			.buttonStyle(.borderedProminent)
		}
		.overlay(loadingOverlay)
	}
	
	@ViewBuilder
	private var loadingOverlay: some View {
		if viewModel.isLoading {
			ProgressView()
				.progressViewStyle(CircularProgressViewStyle(tint: .blue))
				.padding(50)
				.background(.regularMaterial)
				.mask(RoundedRectangle(cornerRadius: 8))
		}
	}
}

struct JokeView_Previews: PreviewProvider {
	static var previews: some View {
		JokeView()
			.environmentObject(JokeViewModel(fetcher: JokeFetcherImpl()))
	}
}
