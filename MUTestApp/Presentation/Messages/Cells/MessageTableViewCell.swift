import UIKit

class MessageTableViewCell: UITableViewCell {
  // MARK: - IBOutlet
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var fullNameLabel: UILabel!
  @IBOutlet weak var contentLabel: UILabel!
  @IBOutlet weak var dayLabel: UILabel!
  
  // MARK: - Life Circle
  override func layoutIfNeeded() {
    super.layoutIfNeeded()
    preservesSuperviewLayoutMargins = false
    separatorInset = UIEdgeInsets(top: 0, left: 26, bottom: 0, right: 0)
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    avatarImageView.image = UIImage(named: "circle")
    fullNameLabel.text = nil
    contentLabel.text = nil
    dayLabel.text = nil
  }
  
  // MARK: - Public methods
  func setup(with message: Message) {
    let url = message.from.image
    avatarImageView.setImage(url: url, placeholder: UIImage(named: "circle"))
    fullNameLabel.text = message.from.name
    contentLabel.text = message.body
    dayLabel.text = message.dateFormattedString
  }
}
