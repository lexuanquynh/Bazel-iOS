import Foundation
import Domain

public protocol LoginView: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(_ message: String)
    func showSuccess(_ user: User)
}

public class LoginPresenter {
    private weak var view: LoginView?
    private let loginUseCase: LoginUseCase

    public init(view: LoginView, loginUseCase: LoginUseCase) {
        self.view = view
        self.loginUseCase = loginUseCase
    }

    public func login(username: String, password: String) {
        view?.showLoading()
        loginUseCase.execute(username: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.view?.hideLoading()
                switch result {
                case .success(let user):
                    self?.view?.showSuccess(user)
                case .failure(let error):
                    self?.view?.showError(error.localizedDescription)
                }
            }
        }
    }
}