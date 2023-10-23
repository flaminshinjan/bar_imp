import Foundation

class ViewModel: ObservableObject {
    private var timer: Timer?

    func callAPI() {
        // URL of the endpoint
        let url = URL(string: "https://webhook.site/e4e067ee-4ac2-4d6e-a738-d65755f8c5f2")!

        // Create the URL request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"  // Change to "POST" if required

        // Create the URLSession task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // Handle HTTP request error
                print(error)
            } else if let data = data {
                // Handle HTTP request response
                print(String(data: data, encoding: .utf8) ?? "Invalid data")
            } else {
                // Handle unexpected error
                print("Unexpected error")
            }
        }

        // Start the task
        task.resume()
    }

    func setupTimer() {
        timer?.invalidate() // Invalidate the current timer if it's already running
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.callAPI()
        }
    }

    deinit {
        timer?.invalidate()
    }
}
