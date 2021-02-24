
import Foundation
import UIKit

class FacebookSocialMediaButton : SocialMediaButtons {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: 57/255, green: 90/255, blue: 147/255, alpha: 1)
        setImage(UIImage(named: "fb"), for: UIControl.State.normal)
        setTitle("Facebook", for: UIControl.State.normal)
        
    }
}
