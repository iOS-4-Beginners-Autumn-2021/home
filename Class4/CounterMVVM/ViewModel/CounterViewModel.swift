//
//  CounterViewModel.swift
//  CounterMVVM
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

class CounterViewModel: ObservableObject {
	
	enum Operation: String {
		case increment = "⏫"
		case decrement = "⏬"
	}
	
	init(counter: Counter) {
		self.counter = counter
		count = counter.count
	}
	
	private let counter: Counter
	
	@Published var operation: Operation = .increment
	@Published var count: Int
	
	let possibleOperation: [Operation] = [.increment, .decrement]
	
	func buttonTapped() {
		switch operation {
		case .increment: counter.increment()
		case .decrement: counter.decrement()
		}
		count = counter.count
	}
	
}
