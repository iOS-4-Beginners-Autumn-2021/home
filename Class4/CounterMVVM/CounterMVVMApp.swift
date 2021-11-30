//
//  CounterMVVMApp.swift
//  CounterMVVM
//
//  Created by Rafał Kwiatkowski on 29/11/2021.
//

import SwiftUI

@main
struct CounterMVVMApp: App {
	var body: some Scene {
		WindowGroup {
			CounterView()
				.environmentObject(CounterViewModel(counter: RandomCounter()))
		}
	}
}
