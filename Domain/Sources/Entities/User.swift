import Foundation

public struct User {
    public let id: String
    public let username: String

    public init(id: String, username: String) {
        self.id = id
        self.username = username
    }
}