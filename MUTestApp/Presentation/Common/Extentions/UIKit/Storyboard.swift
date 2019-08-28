import UIKit

enum Storyboard {
  static let messages = UIStoryboard(name: "Messages", bundle: nil)
}

extension UIStoryboard {
  func instantiate<T: UIViewController>() -> T {
    let viewController = instantiateViewController(withIdentifier: String(describing: T.self))
    
    guard let typedViewController = viewController as? T else { fatalError("Cannot instantiate viewController") }
    
    return typedViewController
  }
}
