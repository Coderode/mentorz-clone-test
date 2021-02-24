

import UIKit

class ButtonView: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        backgroundColor = #colorLiteral(red: 0.968627451, green: 0.1803921569, blue: 0.2196078431, alpha: 1)
        setTitleColor(UIColor.white, for: UIControl.State.normal)
        titleLabel!.font = UIFont.boldSystemFont(ofSize: CGFloat(23))
        tintColor = .black
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
//        contentEdgeInsets = UIEdgeInsets(top: 18,left: 0,bottom: 18,right: 0)
    }
}
