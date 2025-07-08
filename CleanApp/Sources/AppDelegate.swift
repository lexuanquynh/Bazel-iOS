import UIKit
import Presentation
import Domain
import Data

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let repository: LoginRepository = LoginRepositoryImpl()
        let useCase: LoginUseCase = LoginUseCaseImpl(repository: repository)
        let viewController = LoginViewController(presenter: nil)
        viewController.presenter = LoginPresenter(view: viewController, loginUseCase: useCase)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}