//
//  Counter.swift
//  CounterMVVM
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import Foundation

protocol Counter {
	var count: Int { get }
	func increment()
	func decrement()
}

class SimpleCounter: Counter {
	private(set) var count: Int = 0
	
	func increment() {
		count += 1
	}
	
	func decrement() {
		count -= 1
	}
	
}

class RandomCounter: Counter {
	
	init(range: Range<Int> = 1..<5) {
		self.count = Int.random(in: range)
		self.range = range
	}
	
	private let range: Range<Int>
	
	private(set) var count: Int
	
	func increment() {
		count += Int.random(in: range)
	}
	
	func decrement() {
		count -= Int.random(in: range)
	}
	
	
}
