//
//  SafeAwareView.swift
//  SwiftUI101
//
//  Created by Rafał Kwiatkowski on 15/11/2021.
//

import SwiftUI

struct SafeAwareView: View {
	@State var degrees: Double = 0
	
    var body: some View {
		VStack {
			Spacer()
			/*
			 Geometry Reader is powerful view that can read it's size and frame in global context
			 */
			GeometryReader { proxy in
				VStack(alignment: .center, spacing: 12) {
					Text("Size: \(proxy.size.debugDescription)")
					let globalFrame = proxy.frame(in: .global)
					Text("Global: x = \(globalFrame.origin.x.myFormat()), y =  \(globalFrame.origin.y.myFormat())")
					Text("Global: width = \(globalFrame.width.myFormat()), height = \(globalFrame.height.myFormat()) ")
					Text("Local Frame: \(proxy.frame(in: .local).debugDescription)")
				}
				.background(Color.cyan)
			}
			.frame(height: 300)
			.background(Color.green)
			.padding(.horizontal, 50)
			.rotationEffect(.degrees(degrees))
			.background(Color.mint)
			Slider(value: $degrees, in: 0...180).padding()
			Spacer()
		}
		.background(Color.red)
    }
}

fileprivate extension CGFloat {
	func myFormat() -> String {
		Double(self).formatted(.number.precision(.significantDigits(2)))
	}
}

struct SafeAwareView_Previews: PreviewProvider {
    static var previews: some View {
        SafeAwareView()
    }
}
