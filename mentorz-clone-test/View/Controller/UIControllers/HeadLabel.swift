import UIKit

class HeadLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfLines = 2
        font = UIFont.boldSystemFont(ofSize: CGFloat(23))
        textColor = UIColor.white
    }
}
