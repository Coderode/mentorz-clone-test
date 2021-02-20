
import UIKit

class BottomSwitchButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel!.font = UIFont.boldSystemFont(ofSize: CGFloat(20))
        setTitleColor(UIColor(red: 237/255, green: 77/255, blue: 72/255, alpha: 1), for: UIControl.State.normal)
        contentHorizontalAlignment = .left
    }
}
