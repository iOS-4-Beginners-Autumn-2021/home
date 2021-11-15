//
//  Scroll.swift
//  SwiftUI101
//
//  Created by Rafał Kwiatkowski on 15/11/2021.
//

import SwiftUI

struct Scroll: View {
    var body: some View {
		// To display elements that doesn't fit on screen use ScrollView
		ScrollView {
			ScrollView(.horizontal, showsIndicators: false) { // ScrollView can be horizontal or vertical(default) and can optionally not display scroll indicator
				HStack {
					ForEach(0..<24) {
						Text("\($0)")
					}
				}
			}
			ForEach(24..<50) {
				Text("\($0)")
			}
		}
		.font(.title)
    }
}

struct Scroll_Previews: PreviewProvider {
    static var previews: some View {
        Scroll()
    }
}
