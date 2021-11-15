//
//  Stacks.swift
//  SwiftUI101
//
//  Created by Rafał Kwiatkowski on 15/11/2021.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
		// To arrange views along Z axis use ZStack
		ZStack(alignment: .center) { // All stack have the alignment param
			// Color fill the available space
			Color.green.edgesIgnoringSafeArea(.all)
			// To arrange views along Y axis (vertically) use VStack
			VStack(alignment: .leading, spacing: 20) { // VStack can have only horizontal alignment
					// To arrange views along X axis (horizontally) use HStack
				HStack(alignment: .top, spacing: 30) {  // HStack can have only vertical alignment
					Text("HI")
					Image(systemName: "person.3.sequence.fill")
						.resizable()
						.scaledToFill()
						.frame(height: 50)
						.clipped()
				}
				.frame(width: 200)
				.background(Color.red)
				HStack(alignment: .top, spacing: 40) { // Only HStack and VStack have spacings
					Text("HI")
					Image(systemName: "person.3.sequence.fill")
						.resizable()
						.scaledToFit()
						.frame(height: 50)
						.clipped()
				}
				.frame(width: 300)
				.background(Color.red)
			}.frame(width: 300)
			.background(Color.blue)
		}
    }
}

struct Stacks_Previews: PreviewProvider {
    static var previews: some View {
		Stacks()
    }
}
