import SwiftUI


struct AuthResponse: Codable {
    let success: Bool
    // other properties you expect in the response
}

class AuthManager: ObservableObject {
    // ... other properties
    
    func login(name: String, password: String, completion: @escaping (Bool) -> Void) {
        let loginEndpoint = "https://yourapi.com/login" // Replace with your actual API endpoint
        
        guard let url = URL(string: loginEndpoint) else {
            completion(false)
            return
        }
        
        // Prepare the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Create JSON payload
        let json: [String: Any] = [
            "username": name,
            "password": password
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json)
        } catch {
            completion(false)
            return
        }
        
        // Make the API request
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle response
            if let data = data {
                // Parse the response and check if authentication is successful
                do {
                    let response = try JSONDecoder().decode(AuthResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(response.success)
                    }
                } catch {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }.resume()
    }
}
