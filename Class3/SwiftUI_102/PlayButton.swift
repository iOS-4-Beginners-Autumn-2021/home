//
//  PlayButton.swift
//  SwiftUI_102
//
//  Created by Rafał Kwiatkowski on 23/11/2021.
//

import SwiftUI

struct PlayButton: View {
	
	@Binding var isPlaying: Bool
	@Environment(\.isEnabled) var isEnabled: Bool
	@EnvironmentObject var progressModel: PlaybackProgressModel
	
	var body: some View {
		Button(action: {
			isPlaying.toggle()
			isPlaying ? progressModel.start() : progressModel.stop()
		}) {
			Image(systemName: isPlaying ? "pause.circle" : "play.circle")
				.resizable()
				.frame(width: 80, height: 80)
				.foregroundColor(isEnabled ? .white : .gray)
				.rotationEffect(.init(degrees: 180 * progressModel.progress))
		}
	}
}

struct PlayerButtons_Previews: PreviewProvider {
	static var previews: some View {
		ZStack {
			Color.gray.edgesIgnoringSafeArea(.all)
			PlayButton(isPlaying: .constant(true))
		}
	}
}
