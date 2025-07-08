import Foundation

public protocol LoginRepository {
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

public protocol LoginUseCase {
    func execute(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

public class LoginUseCaseImpl: LoginUseCase {
    private let repository: LoginRepository

    public init(repository: LoginRepository) {
        self.repository = repository
    }

    public func execute(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        repository.login(username: username, password: password, completion: completion)
    }
}