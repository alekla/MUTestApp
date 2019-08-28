import UIKit

class BaseViewController: UIViewController {
  private var shadowImageView: UIImageView?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if shadowImageView == nil {
      shadowImageView = findShadowImage(under: navigationController!.navigationBar)
    }
    shadowImageView?.isHidden = true
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    shadowImageView?.isHidden = false
  }
  
  private func findShadowImage(under view: UIView) -> UIImageView? {
    if view is UIImageView && view.bounds.size.height <= 1 {
      return (view as! UIImageView)
    }
    
    for subview in view.subviews {
      if let imageView = findShadowImage(under: subview) {
        return imageView
      }
    }
    return nil
  }
}
