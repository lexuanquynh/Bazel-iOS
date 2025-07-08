import XCTest
@testable import CleanApp
@testable import Domain
@testable import Data
@testable import Presentation

class LoginTests: XCTestCase {
    func testLoginSuccess() {
        // Arrange
        let repository: LoginRepository = LoginRepositoryImpl()
        let useCase: LoginUseCase = LoginUseCaseImpl(repository: repository)
        let mockView = MockLoginView()
        let presenter = LoginPresenter(view: mockView, loginUseCase: useCase)

        // Act
        presenter.login(username: "admin", password: "password123")

        // Assert
        let expectation = XCTestExpectation(description: "Login success")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(mockView.loadingShown, "Loading should be shown")
            XCTAssertFalse(mockView.loadingShown, "Loading should be hidden after completion")
            XCTAssertNil(mockView.errorMessage, "No error should be shown")
            XCTAssertNotNil(mockView.user, "User should be set")
            XCTAssertEqual(mockView.user?.username, "admin", "Username should be 'admin'")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func testLoginFailure() {
        // Arrange
        let repository: LoginRepository = LoginRepositoryImpl()
        let useCase: LoginUseCase = LoginUseCaseImpl(repository: repository)
        let mockView = MockLoginView()
        let presenter = LoginPresenter(view: mockView, loginUseCase: useCase)

        // Act
        presenter.login(username: "wrong", password: "wrong")

        // Assert
        let expectation = XCTestExpectation(description: "Login failure")


        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertTrue(mockView.loadingShown, "Loading should be shown")
            XCTAssertFalse(mockView.loadingShown, "Loading should be hidden after completion")
            XCTAssertNotNil(mockView.errorMessage, "Error message should be set")
            XCTAssertEqual(mockView.errorMessage, "Invalid credentials", "Error message should be 'Invalid credentials'")
            XCTAssertNil(mockView.user, "User should not be set")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
}

class MockLoginView: LoginView {
    var loadingShown = false
    var errorMessage: String?
    var user: User?

    func showLoading() {
        loadingShown = true
    }

    func hideLoading() {
        loadingShown = false
    }

    func showError(_ message: String) {
        errorMessage = message
    }

    func showSuccess(_ user: User) {
        self.user = user
    }
}