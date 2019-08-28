import UIKit

extension UIViewController {
  func showAlert(with title: String, message: String, closeTitle: String = "Ok") {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(
      UIAlertAction(
        title: closeTitle,
        style: .default,
        handler: nil))
    self.present(
      alert,
      animated: true)
  }
}
