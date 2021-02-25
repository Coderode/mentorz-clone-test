import UIKit
class MessageAlert: UIViewController {

    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var headTitle = String()
    var desc = String()
    var buttonTitle = String()
    var buttonAction : (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    func setupView(){
        self.titleLabel.text = headTitle
        self.descriptionLabel.text = desc
        self.button.setTitle(buttonTitle, for: .normal)
    }
    @objc func didTapButton(_ sender : Any){
        dismiss(animated: true, completion: nil)
        self.buttonAction?()
    }
}

class MessageAlertService {
    func alert(title: String, desc: String, buttonTitle: String,completion: @escaping () -> Void) -> MessageAlert {
        let storyBoard = UIStoryboard(name: "Alert", bundle: .main)
        let alertVC = storyBoard.instantiateViewController(withIdentifier: "MessageAlert") as! MessageAlert
        alertVC.headTitle = title
        alertVC.desc = desc
        alertVC.buttonTitle = buttonTitle
        alertVC.buttonAction = completion
        return alertVC
    }
    
}
