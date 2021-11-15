//
//  LoopViews.swift
//  SwiftUI101
//
//  Created by Rafał Kwiatkowski on 15/11/2021.
//

import SwiftUI

struct ControlFlowView: View {
	let identifiableData = Array(0...10).map(IdentifiableData.init(id:))
	let notIdentifiableData = Array(0...10).map(NotIdentifiableData.init(number:))
	
    var body: some View {
		VStack {
			HStack {
				// You can iterate over range with ForEach
				ForEach(1..<11) { index in
					Text("\(index)")
					// You can use if statements in Views
					if index % 2 == 0 && index != 10 {
						Divider().frame(width: 5, height: 12)
					} else if index != 10 {
						Text("፡")
					}
				}
			}
			VStack {
				// You can iterate over collection with Elements conforming to Identifiable
				ForEach(identifiableData) { data in
					Text("\(data.text)")
					// You can use also switch in View 🤯
					switch data.id {
					case 0...3: Divider()
					case 4...8: RoundedRectangle(cornerRadius: 12).fill(Color.red).frame(height: 24)
					default: EmptyView()
					}
				}
			}
			HStack {
				// You can iterate over collection with Elements conforming to Hashable
				ForEach(notIdentifiableData, id: \.self) { data in
					Text("\(data.number)")
				}
			}
		}
    }
}

struct IdentifiableData: Identifiable {
	let id: Int
	var text: String { "My id is \(id)" }
}

struct NotIdentifiableData: Hashable {
	let number: Int
}

struct ControlFlowView_Previews: PreviewProvider {
    static var previews: some View {
		ControlFlowView()
    }
}
