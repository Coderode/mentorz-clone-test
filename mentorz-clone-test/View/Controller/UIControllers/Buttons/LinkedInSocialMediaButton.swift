import Foundation
import UIKit

class LinkedInSocialMediaButton : SocialMediaButtons {
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor(red: 0/255, green: 121/255, blue: 176/255, alpha: 1)
        setImage(UIImage(named: "linkedin-1"), for: UIControl.State.normal)
        setTitle("Linkedin", for: UIControl.State.normal)
    }
}
