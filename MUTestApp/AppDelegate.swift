import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.makeKeyAndVisible()
    
    URLCache.shared.removeAllCachedResponses()
    let servicesFactory = ServicesFactoryImp()
    let modulesFactory = ModulesFactoryImp(servicesFactory: servicesFactory)
    let coordinator = AppCoordinator()
    coordinator.start(window: window, modulesFactory: modulesFactory)
    
    return true
  }
}
