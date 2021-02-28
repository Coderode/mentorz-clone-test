import UIKit
class BottomLinkLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        font = UIFont.systemFont(ofSize: CGFloat(12))
        textColor = UIColor.white
        textAlignment = .right
        numberOfLines = 2
    }
}
