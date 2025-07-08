import Foundation
import Domain

public class LoginRepositoryImpl: LoginRepository {
    public init() {}

    public func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Mockup data
        if username == "admin" && password == "password123" {
            let user = User(id: UUID().uuidString, username: username)
            completion(.success(user))
        } else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])))
        }
    }
}