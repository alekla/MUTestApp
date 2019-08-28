import Kingfisher
import UIKit

extension UIImageView {
  
  func setImage(url: String, placeholder: UIImage?) {
    guard let urlString = URL(string: url) else {
      return
    }
    guard let placeholderImage = placeholder else {
      fatalError("placeholder must be")
    }
    
    kf.indicatorType = .activity
    self.kf.setImage(
      with: urlString,
      placeholder: placeholderImage,
      options: [.transition(.fade(1)), .cacheOriginalImage])
  }
  
}


