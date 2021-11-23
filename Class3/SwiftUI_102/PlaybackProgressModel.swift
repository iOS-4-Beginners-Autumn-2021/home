//
//  PlaybackProgressModel.swift
//  SwiftUI_102
//
//  Created by Rafał Kwiatkowski on 22/11/2021.
//

import Foundation
import Combine

class PlaybackProgressModel: ObservableObject {
	
	@Published var progress: Double = 0
	
	private var cancellable: Cancellable?
	
	func start() {
		cancellable = Timer.publish(every: 0.1, on: .main, in: .default)
			.autoconnect()
			.receive(on: DispatchQueue.main)
			.map { [unowned self] _ in min(Double(1), self.progress + 0.001) }
			.assign(to: \.progress, on: self)
	}
	
	func stop() {
		cancellable?.cancel()
		cancellable = nil
	}
}
