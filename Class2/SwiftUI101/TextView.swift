//
//  TextView.swift
//  SwiftUI101
//
//  Created by Rafał Kwiatkowski on 15/11/2021.
//

import SwiftUI

struct TextView: View {
    var body: some View {
		// Text for displaying strings
        Text("Hello, World! 👋")
			.bold()
			.lineLimit(2)
			.lineSpacing(30)
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
