import UIKit

class AppCoordinator {
  func start(window: UIWindow, modulesFactory: ModulesFactory) {
    let coordinator = MessagesCoordinator()
    coordinator.start(window: window, modulesFactory: modulesFactory)
  }
}
