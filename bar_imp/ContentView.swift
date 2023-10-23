import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            // Adding some design to the button so it's visible and tappable
            Button(action: {
                viewModel.callAPI()
            }) {
                Text("Call API")
                    .frame(minWidth: 0, maxWidth: .infinity) // Makes the button expand to fill available width
                    .padding() // Add padding around text
                    .foregroundColor(.white) // Set text color to white
                    .background(Color.blue) // Set background color to blue
                    .cornerRadius(10) // Round the corners
            }
            .padding() // Add padding around button
        }
        .onAppear {
            viewModel.setupTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
