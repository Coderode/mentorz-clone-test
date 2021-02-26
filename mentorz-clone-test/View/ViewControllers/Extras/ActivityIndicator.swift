//
//  ActivityIndicator.swift
//  mentorz-clone-test
//
//  Created by craterzone on 26/02/21.
//

import UIKit

class ActivityIndicator: UIViewController {
    var timer: Timer?
    @IBOutlet weak var circularImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval:0.0, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: false)
        }
    }
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func animateView() {
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.circularImage.transform = self.circularImage.transform.rotated(by: CGFloat(Double.pi))
        }, completion: { (finished) in
            if self.timer != nil {
                self.timer = Timer.scheduledTimer(timeInterval:0.0, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: false)
            }
        })
    }
    
    func stopIndicator(_ sender: UIViewController) {
        sender.dismiss(animated: true, completion: nil)
        stopTimer()
    }
    func startIndicator(_ sender: UIViewController) {
        startTimer()
        sender.present(self, animated: true, completion: nil)
    }
}

class ActivityIndicatorService {
    static func get() -> ActivityIndicator{
        let storyBoard = UIStoryboard(name: "Extras", bundle: .main)
        let activityIndicator = storyBoard.instantiateViewController(withIdentifier: "ActivityIndicator") as! ActivityIndicator
        return activityIndicator
    }
    
    
}
