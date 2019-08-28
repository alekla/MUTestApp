import UIKit

class MessagesCoordinator {
  private weak var window: UIWindow!
  private var modulesFactory: ModulesFactory!

  func start(window: UIWindow, modulesFactory: ModulesFactory) {
    self.window = window
    self.modulesFactory = modulesFactory
    openRootModule()
  }

  private func openRootModule() {
    let (_, nav) = modulesFactory.makeMessagesModule()
    window.rootViewController = nav
  }
}
