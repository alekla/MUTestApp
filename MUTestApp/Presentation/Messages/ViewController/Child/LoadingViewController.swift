import UIKit

class LoadingViewController: UIViewController {
  private lazy var activityIndicator = UIActivityIndicatorView(style: .gray)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupActivityIndicator()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // We use a 0.5 second delay to not show an activity indicator
    // in case our data loads very quickly.
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
      self?.activityIndicator.startAnimating()
    }
  }
  
  private func setupActivityIndicator() {
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(activityIndicator)
    
    NSLayoutConstraint.activate([
      activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
