import Foundation
import UIKit

class AppleSocialMediaButton : SocialMediaButtons {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.black
        setImage(UIImage(named: "apple-logo"), for: UIControl.State.normal)
        setTitle("Apple", for: UIControl.State.normal)
    }
}
