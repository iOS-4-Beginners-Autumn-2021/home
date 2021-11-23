//
//  SimplePlayerView.swift
//  SwiftUI_102
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import SwiftUI
import Combine

struct SimplePlayerView: View {
	
	@State var isPlaying: Bool = false
	@EnvironmentObject var progressModel: PlaybackProgressModel
	@State var gradientColors = [Color.yellow, Color.green]
    var body: some View {
		ZStack {
			gradientColors[0]
				.edgesIgnoringSafeArea(.all)
				.animation(.default, value: gradientColors)
				.onChange(of: isPlaying) { _ in
					self.gradientColors = gradientColors.reversed()
				}
			VStack {
				Spacer()
				Image(systemName: "swift")
					.resizable()
					.scaledToFit()
					.frame(height: 250)
					.foregroundColor(.orange)
				Spacer()
				Text("Swift Music")
					.font(.largeTitle)
					.bold()
					.foregroundColor(isPlaying ? .white : .gray)
				Text("iOS Developers")
					.font(.subheadline)
					.opacity(0.8)
				Spacer()
				Slider(value: $progressModel.progress, in: 0...1)
					.accentColor(.white)
					.padding()
				HStack(spacing: 50) {
					Spacer()
					Image(systemName: "backward.circle")
						.resizable()
						.frame(width: 40, height: 40)
					PlayButton(isPlaying: $isPlaying)
//						.disabled(isPlaying)
					Image(systemName: "forward.circle")
						.resizable()
						.frame(width: 40, height: 40)
					Spacer()
				}
				Spacer()
			}
			.foregroundColor(.white)
		}
//		.onAppear { progressModel.start() }
//		.onDisappear { progressModel.stop() }
    }
	
	
}

struct PlayButtonView: View {
	@Binding var isPlaying: Bool
	
	var body: some View {
		Button(action: { isPlaying.toggle() }) {
			Image(systemName: isPlaying ? "pause.circle" : "play.circle")
				.resizable()
				.frame(width: 80, height: 80)
		}
	}
}

struct SimplePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SimplePlayerView()
			.environmentObject(PlaybackProgressModel())
    }
}
