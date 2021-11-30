import SwiftUI

struct CounterView: View {
	
	@EnvironmentObject var viewModel: CounterViewModel
	
    var body: some View {
		VStack {
			Spacer()
			Text("\(viewModel.count)")
				.font(.largeTitle)
			Spacer()
			Picker("Select operation", selection: $viewModel.operation) {
				ForEach(viewModel.possibleOperation, id: \.self) { operation in
					Text(operation.rawValue)
				}
			}
			.pickerStyle(.segmented)
			Spacer()
			Button("Apply operation", action: viewModel.buttonTapped)
				.font(.title)
				.buttonStyle(.bordered)
			Spacer()
		}
		.padding(.horizontal, 32)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
			.environmentObject(CounterViewModel(counter: RandomCounter()))
    }
}
