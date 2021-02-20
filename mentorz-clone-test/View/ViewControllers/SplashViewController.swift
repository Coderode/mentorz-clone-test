import UIKit
class SplashViewController: UIViewController {
    
    @IBOutlet weak var orView: UIView!
    
    @IBOutlet weak var orLeft: UIView!
    
    @IBOutlet weak var orRight: UIView!
    
    @IBOutlet weak var orLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        orView.backgroundColor = UIColor.clear
        orView.isOpaque = false
        orLeft.addTopBorderWithColor(color: .white, width: 1)
        orRight.addTopBorderWithColor(color: .white, width: 1)
        orLabel.textColor = .white
    }
}

