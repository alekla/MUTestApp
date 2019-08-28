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
    let view = UIViewController()
    let nav = UINavigationController(rootViewController: view)
    
    return (view, nav)
  }
}
