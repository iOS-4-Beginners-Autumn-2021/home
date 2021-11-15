//
//  ImageView.swift
//  SwiftUI101
//
//  Created by Rafał Kwiatkowski on 15/11/2021.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image(systemName: "graduationcap.fill")
			.resizable()
			.scaledToFit()
			.frame(width: 300, height: 400)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
