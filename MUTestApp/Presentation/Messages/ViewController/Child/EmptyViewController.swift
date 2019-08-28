import UIKit

class EmptyViewController: UIViewController {
  // MARK: - Types
  enum Constats {
    static let errorLabelTitle = "Nothing found"
  }
  
  // MARK: - Private Properties
  private let errorLabel = UILabel()
  
  // MARK: - Life Circle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupErrorLabel()
  }
  
  // MARK: - Private Methods
  private func setupErrorLabel() {
    view.backgroundColor = .white
    errorLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(errorLabel)
    
    NSLayoutConstraint.activate([
      errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      errorLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    errorLabel.text = Constats.errorLabelTitle
    errorLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    errorLabel.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1)
    errorLabel.textAlignment = .center
  }
}


