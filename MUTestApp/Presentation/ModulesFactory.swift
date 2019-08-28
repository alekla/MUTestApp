import UIKit

protocol ModulesFactory {
  
  func makeMessagesModule() -> (UIViewController, UIViewController)
}

class ModulesFactoryImp: ModulesFactory {
  let servicesFactory: ServicesFactory
  
  init(servicesFactory: ServicesFactory) {
    self.servicesFactory = servicesFactory
  }
  
  func makeMessagesModule() -> (UIViewController, UIViewController) {
    guard let navView: UIViewController = Storyboard.messages.instantiateInitialViewController() else {
      fatalError("instantiateInitialViewController must be")
    }
    
    guard let nav = navView as? UINavigationController, let view = nav.viewControllers.first as? MessagesViewController else {
      fatalError("MessagesViewController must be")
    }
    let controller = MessagesControllerImp(
      messagesService: servicesFactory.messagesService)
    view.controller = controller
    return (view, nav)
  }
}
